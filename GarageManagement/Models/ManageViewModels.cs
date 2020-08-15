using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;

namespace GarageManagement.Models
{
    public class IndexViewModel
    {
        public bool HasPassword { get; set; }
        public IList<UserLoginInfo> Logins { get; set; }
        public string PhoneNumber { get; set; }
        public bool TwoFactor { get; set; }
        public bool BrowserRemembered { get; set; }
    }

    public class ManageLoginsViewModel
    {
        public IList<UserLoginInfo> CurrentLogins { get; set; }
        public IList<AuthenticationDescription> OtherLogins { get; set; }
    }

    public class FactorViewModel
    {
        public string Purpose { get; set; }
    }

    public class SetPasswordViewModel
    {
        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class ChangePasswordViewModel
    {
        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Current password")]
        public string OldPassword { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "New password")]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm new password")]
        [Compare("NewPassword", ErrorMessage = "The new password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
    }

    public class AddPhoneNumberViewModel
    {
        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string Number { get; set; }
    }

    public class VerifyPhoneNumberViewModel
    {
        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }

        [Required]
        [Phone]
        [Display(Name = "Phone Number")]
        public string PhoneNumber { get; set; }
    }

    public class ConfigureTwoFactorViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
    }

    public class Prods
    {
        public int qtd { get; set; }
        public int id { get; set; }
    }

    public class BookingView
    {
        [Required]
        [Display(Name = "Vehicle Type")]
        public int VehicleType { get; set; }

        [Required]
        [Display(Name = "Engine Type")]
        public int EngineType { get; set; }

        [Required]
        [Display(Name = "Make")]
        public string Make { get; set; }

        [Required]
        [Display(Name = "Booking Type")]
        public int BookingTypeId { get; set; }

        [Required]
        [Display(Name = "Date")]
        [DataType(DataType.Date)]
        public DateTime DueDate { get; set; }

        [Required]
        [Display(Name = "Observation")]
        public string Observation { get; set; }
                
        [Display(Name = "Other")]
        public string Other { get; set; }

        [Required]
        [Display(Name = "VRC")]
        public string VRC { get; set; }

        [Required]
        [Display(Name = "VLC")]
        public string VLC { get; set; }

        [Required]
        [Display(Name = "Licence")]
        public string Licence { get; set; }

        [Display(Name = "Basic Cost")]
        public decimal BasicCost { get; set; }

        public string StatusName { get; set; }
        public int StatusId { get; set; }
        public int StaffId { get; set; }
        public int Id { get; set; }
    }

    public class PrintView
    {
        public Bookings Booking { get; set; }
        public List<booking_cost> Products { get; set; }
    }

    public class ServicesAndPartsView
    {
        [Required]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Required]
        [Display(Name = "Price")]
        public decimal Price { get; set; }

        public int Id { get; set; }
    }
}

