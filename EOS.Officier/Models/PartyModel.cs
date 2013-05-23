using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EOS.Officier.Models
{
    public class PartyModel
    {
        public Citizen Manager { get; set; }
        public Party Party { get; set; }
        public string SearchIdentity { get; set;}
        public PartyModel()
        {
            Manager = new Citizen();
            Party = new Party();
        }
    }
}