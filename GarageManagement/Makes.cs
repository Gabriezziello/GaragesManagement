//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GarageManagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class Makes
    {
        public int Id { get; set; }
        public int VehicleTypeId { get; set; }
        public string Name { get; set; }
    
        public virtual VehicleType VehicleType { get; set; }
    }
}