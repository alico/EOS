using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EOS.Officier.Models
{
    public class RegionModel
    {
        public Region Region { get; set; }
        public List<int> SelectedDistricts { get; set; }
        public List<District> Districts { get; set; }

        public RegionModel()
        {
            Region = new Region();
            SelectedDistricts = new List<int>();
            Districts = new List<District>();
        }
    }
}