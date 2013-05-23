using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Text.RegularExpressions;

namespace TCNufusMudurlugu
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class srvPopulation : IService1
    {
        CitizenDataContext m_CitizenDC;
        
        #region IService1 Members
        public Citizen GetData(string IdentityNo)
        {
            if (IdentityNo.Length == 11 || Regex.IsMatch(IdentityNo, @"\d"))
            {
                m_CitizenDC = new CitizenDataContext(Globals.ConnectionString);
                if (m_CitizenDC.Citizens.Any(k => k.IdentityNo == IdentityNo))
                {
                    var m_citizen = m_CitizenDC.Citizens.First(k => k.IdentityNo == IdentityNo);

                    return m_citizen;
                }
            }
            return null;
        }
        public List<Citizen> GetCitizens()
        {
            m_CitizenDC = new CitizenDataContext(Globals.ConnectionString);
            return m_CitizenDC.Citizens.ToList();
        }
        #endregion
    }
}
