using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace MvcDemo.Models
{
    public class EmpModel
    {
        [Display(Name="Id")]
        public int EmpId { get; set; }

        [Required(ErrorMessage="First Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage="City is required")]
        public string City { get; set; }

        [Required(ErrorMessage="Address is required")]
        public string Address { get; set; }
    }
}