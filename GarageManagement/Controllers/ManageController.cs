using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using GarageManagement.Models;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace GarageManagement.Controllers
{
    [Authorize]
    public class ManageController : Controller
    {
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;

        public ManageController()
        {
        }

        public ManageController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set 
            { 
                _signInManager = value; 
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
          

        //
        // GET: /Manage/ChangePassword
        public ActionResult ChangePassword()
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        //
        // POST: /Manage/ChangePassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                }
                return RedirectToAction("Index", new { Message = ManageMessageId.ChangePasswordSuccess });
            }
            AddErrors(result);
            return View(model);
        }

        //
        // GET: /Manage/SetPassword
        public ActionResult SetPassword()
        {
            return View();
        }

        //
        // POST: /Manage/SetPassword
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SetPassword(SetPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await UserManager.AddPasswordAsync(User.Identity.GetUserId(), model.NewPassword);
                if (result.Succeeded)
                {
                    var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                    if (user != null)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    }
                    return RedirectToAction("Index", new { Message = ManageMessageId.SetPasswordSuccess });
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

       

        //
        // POST: /Manage/LinkLogin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LinkLogin(string provider)
        {
            // Request a redirect to the external login provider to link a login for the current user
            return new AccountController.ChallengeResult(provider, Url.Action("LinkLoginCallback", "Manage"), User.Identity.GetUserId());
        }

        //
        // GET: /Manage/LinkLoginCallback
        public async Task<ActionResult> LinkLoginCallback()
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync(XsrfKey, User.Identity.GetUserId());
            if (loginInfo == null)
            {
                return RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
            }
            var result = await UserManager.AddLoginAsync(User.Identity.GetUserId(), loginInfo.Login);
            return result.Succeeded ? RedirectToAction("ManageLogins") : RedirectToAction("ManageLogins", new { Message = ManageMessageId.Error });
        }

        
        public ActionResult Booking()
        {
            ViewBag.BookingTypes = GetBookingTypes();
            ViewBag.VehicleTypeList = GetVehicleTypes();
            ViewBag.EngineTypes = GetEngineTypes();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                var listMakes = entities.Makes.ToList();
                var userId = User.Identity.GetUserId();
                var customerId = entities.Customer.FirstOrDefault(x => x.UserId == userId).Id;
                var booking = entities.Bookings.OrderByDescending(x => x.DueDate).FirstOrDefault(x => x.CustomerId == customerId);
                var model = booking != null ? new BookingView()
                {
                    BookingTypeId = booking.BookingTypeId,
                    DueDate = booking.DueDate.Value,
                    Make = listMakes.Any(y => y.Name == booking.Make) ? booking.Make : "Other",
                    EngineType = booking.EngineTypeId,
                    Observation = booking.Observation,
                    Other = listMakes.Any(y => y.Name == booking.Make) ? "" : booking.Make,
                    VehicleType = booking.VehicleTypeId,
                    VLC = booking.VLC,
                    VRC = booking.VRC,
                    Licence = booking.Licence,
                    StatusName = booking.Status.Name,
                    StatusId = booking.StatusId,
                    Id = booking.Id,
                    BasicCost = booking.BasicCost.HasValue ? booking.BasicCost.Value : 0,
                    StaffId = booking.StaffId.HasValue ? booking.StaffId.Value : 0

                } : null;
                return View(model);
            }             
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Booking(BookingView model)
        {
            if(model.Make == "Other" && string.IsNullOrEmpty(model.Other))
            {
                ModelState.AddModelError("Other", "'Other' field is mandatory if you have selected Other on Make's Dropdownlist.");
            }

            if (model.Id > 0 && model.BasicCost == 0)
            {
                ModelState.AddModelError("BasicCost", "'BasicCost' field is mandatory if you are changing an existent booking.");
            }
            if (ModelState.IsValid)
            {
                using (GarageManagementEntities entities = new GarageManagementEntities())
                {
                    var userId = User.Identity.GetUserId().ToString();
                    var customerId = entities.Customer.FirstOrDefault(x => x.UserId == userId).Id;
                    
                    var newBooking = new Bookings()
                    {
                        BookingTypeId = model.BookingTypeId,
                        DueDate = model.DueDate,
                        Make = model.Other ?? model.Make,
                        CustomerId = customerId,
                        Observation = model.Observation,
                        StatusId = 1,
                        EngineTypeId = model.EngineType,
                        VRC = model.VRC,
                        VLC = model.VLC,
                        Licence = model.Licence,
                        VehicleTypeId = model.VehicleType

                    };

                    if (model.Id > 0) {
                        var oldBooking = entities.Bookings.FirstOrDefault(x => x.Id == model.Id);

                        oldBooking.BookingTypeId = model.BookingTypeId;
                        oldBooking.DueDate = model.DueDate;
                        oldBooking.Make = model.Other ?? model.Make;
                        oldBooking.CustomerId = customerId;
                        oldBooking.Observation = model.Observation;
                        oldBooking.StatusId = model.StatusId;
                        oldBooking.StaffId = model.StaffId;
                        oldBooking.EngineTypeId = model.EngineType;
                        oldBooking.VRC = model.VRC;
                        oldBooking.VLC = model.VLC;
                        oldBooking.Licence = model.Licence;
                        oldBooking.VehicleTypeId = model.VehicleType;
                        oldBooking.BasicCost = model.BasicCost;
                    }
                    else
                    {
                        entities.Bookings.Add(newBooking);
                    }
                    
                    entities.SaveChanges();

                    return RedirectToAction("ConfirmBooking", "Manage");
                }
            }


            ViewBag.Staffs = GetAvailableStaff(model.DueDate);
            ViewBag.Status = GetStatus();

            ViewBag.BookingTypes = GetBookingTypes();
            ViewBag.VehicleTypeList = GetVehicleTypes();
            ViewBag.EngineTypes = GetEngineTypes();
            if (model.Id > 0)
            {
                return View("EditBooking",model);
            }
            // If we got this far, something failed, redisplay form
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditService(ServicesAndPartsView model)
        {            
            if (ModelState.IsValid)
            {
                using (GarageManagementEntities entities = new GarageManagementEntities())
                {
                 
                    var part = entities.ServicesAndParts.FirstOrDefault(x => x.Id == model.Id);

                    var newPart = new ServicesAndParts()
                    {
                        Name = model.Name,
                        Price = model.Price

                    };

                    if (model.Id > 0)
                    {
                        part.Name = model.Name;
                        part.Price = model.Price;                        
                    }
                    else
                    {
                        entities.ServicesAndParts.Add(newPart);
                    }

                    entities.SaveChanges();

                    return RedirectToAction("ConfirmServicesAndParts", "Manage");
                }
            }

            
            return View(model);
        }

        private List<SelectListItem> GetVehicleTypes()
        {
            List<SelectListItem> VehicleTypes;

            using (GarageManagementEntities entities = new GarageManagementEntities())
            {               

                VehicleTypes = entities.VehicleType.Select(x => new SelectListItem()
                {
                    Text = x.Name,
                    Value = x.Id.ToString(),
                }).ToList();
            }

            return VehicleTypes;
        }

        private List<SelectListItem> GetBookingTypes()
        {
            List<SelectListItem> items;

            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                items = entities.BookingTypes.Select(x => new SelectListItem()
                {
                    Text = x.Name,
                    Value = x.Id.ToString(),
                }).ToList();
            }

            return items;
        }

        private List<SelectListItem> GetStatus()
        {
            List<SelectListItem> items;

            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                items = entities.Status.Select(x => new SelectListItem()
                {
                    Text = x.Name,
                    Value = x.Id.ToString(),
                }).ToList();
            }

            return items;
        }

        private List<SelectListItem> GetEngineTypes()
        {
            List<SelectListItem> items;

            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                items = entities.EngineType.Select(x => new SelectListItem()
                {
                    Text = x.Name,
                    Value = x.Id.ToString(),
                }).ToList();
            }

            return items;
        }

        private List<SelectListItem> GetAvailableStaff(DateTime date)
        {
            List<SelectListItem> items;

            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                var staffs = entities.Database.SqlQuery<int>(string.Format(@"select id from (
select a.id, case when b.BookingTypeId != 4 then 1 when b.BookingTypeId is null then 0 else 2 end as qt, b.BookingTypeId
from Staff a left join Bookings b on b.StaffId = a.Id and (b.DueDate = '{0}' or b.DueDate is null)
)b group by id having SUM(qt) < 4", date.ToString("yyyyMMdd"))).ToList();

                items = entities.Staff.Where(x=> staffs.Contains(x.Id)).Select(x => new SelectListItem()
                {
                    Text = x.Name,
                    Value = x.Id.ToString(),
                }).ToList();
            }

            items.Add(new SelectListItem() { Text = "Please select one Staff", Value = "0" });
            return items;
        }

        [HttpPost]       
        public JsonResult GetMakes(int type)
        {
            Dictionary<string, string> items = new Dictionary<string, string>();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                items = entities.Makes.Where(x=> x.VehicleTypeId == type).ToDictionary(t => t.Name, t => t.Name);
            }
            items.Add("Other","0" );

            return Json(new { result = "success", list = items }, JsonRequestBehavior.AllowGet);
        }

        
        public ActionResult ConfirmBooking()
        {
            return View();
        }

        public ActionResult ModalConfirmServicesAndParts()
        {
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                var products = entities.ServicesAndParts.ToList();
                return View(products);
            }
        }
        public ActionResult ConfirmServicesAndParts()
        {
            return View();
        }

        public ActionResult Print(int id)
        {
            var model = new PrintView();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                model.Products = entities.booking_cost.Include("ServicesAndParts").Where(x => x.BookingId == id).ToList();
                model.Booking = entities.Bookings.Include("Customer").Include("BookingTypes").FirstOrDefault(x => x.Id == id);
            }
            
            return View(model);
        }

        public ActionResult EditService(int id)
        {

            var model = new ServicesAndPartsView();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {             

                var part = entities.ServicesAndParts.FirstOrDefault(x => x.Id == id);
                if(part != null)
                {
                    model = new ServicesAndPartsView()
                    {
                        Name = part.Name,
                        Price = part.Price.Value,
                        Id = part.Id,
                    };
                }

            }
                       
            return View(model);
        }

        public ActionResult EditBooking(int id)
        {
           
            var model = new BookingView();
            
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                var listMakes = entities.Makes.ToList();
               
                var booking = entities.Bookings.FirstOrDefault(x => x.Id == id);

                model = new BookingView()
                {
                    BookingTypeId = booking.BookingTypeId,
                    DueDate = booking.DueDate.Value,
                    Make = listMakes.Any(y => y.Name == booking.Make) ? booking.Make : "Other",
                    EngineType = booking.EngineTypeId,
                    Observation = booking.Observation,
                    Other = listMakes.Any(y => y.Name == booking.Make) ? "" : booking.Make,
                    VehicleType = booking.VehicleTypeId,
                    VLC = booking.VLC,
                    VRC = booking.VRC,
                    Licence = booking.Licence,
                    StatusName = booking.Status.Name,
                    StatusId = booking.StatusId,
                    Id = booking.Id,
                    BasicCost = booking.BasicCost.HasValue ? booking.BasicCost.Value : 0,
                    StaffId = booking.StaffId.HasValue ? booking.StaffId.Value : 0

                };


            }

            ViewBag.Staffs = GetAvailableStaff(model.DueDate);
            ViewBag.Status = GetStatus();
          
            ViewBag.BookingTypes = GetBookingTypes();
            ViewBag.VehicleTypeList = GetVehicleTypes();
            ViewBag.EngineTypes = GetEngineTypes();
            return View(model);
        }

        [HttpPost]
        public JsonResult addProducts(int bookingId, List<Prods> prods)
        {
           
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {        
               if(prods != null)
                {
                    foreach (var item in prods)
                    {
                        var prod = entities.ServicesAndParts.FirstOrDefault(x => x.Id == item.id);
                        var model = new booking_cost()
                        {
                            BookingId = bookingId,
                            Price = prod.Price,
                            Qtd = item.qtd,
                            ServicesAndPartsId = item.id
                        };

                        entities.booking_cost.Add(model);

                    }

                    entities.SaveChanges();
                }                 
               
            }
            return Json(new { result = "success", data = GetProductsByOrder(bookingId) }, JsonRequestBehavior.AllowGet);

        }

        public object GetProductsByOrder(int id)
        {
            var items = new List<booking_cost>();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                items = entities.booking_cost.Include("Bookings").Include("ServicesAndParts").Where(x => x.BookingId == id).ToList();
            }

            return items.Select(x=> new { Id=x.Id, Name = x.ServicesAndParts.Name, Price = x.Price, Qtd = x.Qtd }).ToList();
        }

        public void RemoveProd(int id)
        {
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                var model = entities.booking_cost.FirstOrDefault(x => x.Id == id);
                entities.booking_cost.Remove(model);
                entities.SaveChanges();
            }
        }

            public ActionResult BookingsAdmin()
        {
            var data = new List<Bookings>();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {

                data = entities.Bookings.Include("Customer").Include("BookingTypes").Include("Status").Include("Staff").ToList();


            }
            return View(data);
        }

        public ActionResult ServicesAndParts()
        {
            var data = new List<ServicesAndParts>();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                data = entities.ServicesAndParts.ToList();
            }
            return View(data);
        }

        [HttpPost]
        public JsonResult GetDisabledDates()
        {
            string[] dates;
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                dates = entities.Database.SqlQuery<string>("select convert(varchar, DueDate, 10) from Bookings group by DueDate having COUNT(*) >= 5")
                    .ToList().ToArray();
               
            }
           // dates = new string[] { "08/17/2020", "08/18/2020" };
            return Json(new { result = "success", list = dates }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult GetBookings()
        {
            var data = new List<Bookings>();
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {

                data = entities.Bookings.ToList();
                
                
            }
            return Json(new { data = data }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult RemoveService(int id)
        {
            using (GarageManagementEntities entities = new GarageManagementEntities())
            {
                var model = entities.ServicesAndParts.FirstOrDefault(x => x.Id == id);
                
                entities.ServicesAndParts.Remove(model);
                entities.SaveChanges();
                

            }

            return RedirectToAction("ServicesAndParts", "Manage");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && _userManager != null)
            {
                _userManager.Dispose();
                _userManager = null;
            }

            base.Dispose(disposing);
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }




        public enum ManageMessageId
        {
            AddPhoneSuccess,
            ChangePasswordSuccess,
            SetTwoFactorSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
            RemovePhoneSuccess,
            Error
        }

        #endregion

    }
}