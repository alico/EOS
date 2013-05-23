using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EOS.Officier.Models;

namespace EOS.Officier.Controllers
{
    public class CandidateModel
    {
        public Voter Citizen { get; set; }
        public Candidate Candidate { get; set; }
    }
}