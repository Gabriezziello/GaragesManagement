﻿using System.Web;
using System.Web.Optimization;

namespace GarageManagement
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/dataTable").Include(
                      "~/Scripts/Datatables/jquery.dataTables.min.js",
                      "~/Scripts/Datatables/dataTables.jqueryui.min.js",
                      "~/Scripts/Datatables/dataTables.buttons.min.js",
                      "~/Scripts/Datatables/buttons.print.min.js"
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/bootstrap-datetimepicker.css",
                      "~/Content/DataTables/css/jquery.dataTables.min.css",
                      "~/Content/DataTables/css/dataTables.jqueryui.min.css",
                      "~/Content/DataTables/css/buttons.dataTables.min.css"
                     ));

            bundles.Add(new ScriptBundle("~/bundles/moments").Include(
                     "~/Scripts/moment.js"));
            bundles.Add(new ScriptBundle("~/bundles/bootstrap-datepicker").Include(
                     "~/Scripts/bootstrap-datetimepicker.js"));
        }
    }
}
