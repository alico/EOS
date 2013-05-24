using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace EOS.Officier.Models
{
    public class Globals
    {
        public static string InternetConnectionString { get { return "Data Source=ALICO-PC;Initial Catalog=ESSInternet;User ID=sa;Password=80893043"; } }
        public static string MerkezConnectionString { get { return "Data Source=ALICO-PC;Initial Catalog=ESSMerkez;User ID=sa;Password=80893043"; } }

        private static EOSInternetDataContext m_internetDc = new EOSInternetDataContext(Globals.InternetConnectionString);
        private static ESSMerkezDataContext m_merkezDC = new ESSMerkezDataContext(MerkezConnectionString);



        public static string GetUserName(string IdentityNo)
        {
            if (m_internetDc.Voters.Any(x=>x.IdentityNo==IdentityNo))
            {
                var user = m_internetDc.Voters.First(x => x.IdentityNo == IdentityNo);
                return user.Name + " " + user.Surname;
            }
            return IdentityNo;
        }

        public static List<City> GetCities()
        {

            return m_merkezDC.Cities.OrderBy(x => x.CityName).ToList();
        }

        public static List<District> GetDistricts()
        {
            return m_merkezDC.Districts.ToList();
        }

        public static List<Election> GetElections(string electionStatus)
        {
            var newElections = new List<Election>();
            try
            {
                var elections = m_merkezDC.Elections.ToList();
                if(electionStatus=="NewElections")
                {
                  
                    foreach (var election in elections)
	                {
                        if (  m_merkezDC.ElectionDetails.Any(x=>x.StatusId==1 && x.StartDate<=DateTime.Now && x.FinishDate>=DateTime.Now && x.ElectionId==election.ElectionId))
                        {
                            if (!newElections.Any(x => x.ElectionId == election.ElectionId))
                            {
                                newElections.Add(elections.First(x=>x.ElectionId==election.ElectionId));
                            }
                        }
	                }
                }
                else if (electionStatus == "StartedElections")
                {
                    foreach (var election in elections)
                    {
                        if (m_merkezDC.ElectionDetails.Any(x => x.StatusId == 5 && x.StartDate <= DateTime.Now && x.FinishDate >= DateTime.Now && x.ElectionId == election.ElectionId))
                        {
                            if (!newElections.Any(x => x.ElectionId == election.ElectionId) && !m_merkezDC.ElectionDetails.Any(x => x.ElectionId == election.ElectionId && (x.ElectionStatus.StatusId == 6)))
                            {
                                newElections.Add(elections.First(x => x.ElectionId == election.ElectionId));
                            }
                        }
                    }
                }
                else if (electionStatus == "FinishedElections")
                { 
                     foreach (var election in elections)
                    {
                        if (m_merkezDC.ElectionDetails.Any(x => x.StatusId == 6 && x.StartDate <= DateTime.Now && x.FinishDate >= DateTime.Now && x.ElectionId == election.ElectionId))
                        {
                            if (!newElections.Any(x => x.ElectionId == election.ElectionId))
                            {
                                newElections.Add(elections.First(x => x.ElectionId == election.ElectionId));
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
            }
            return newElections;
        }

        public static List<ElectionType> GetElectionTypes()
        {
            var electionList = new List<ElectionType>();
            try
            {
                electionList=m_merkezDC.ElectionTypes.ToList();
            }
            catch (Exception)
            {
                
            }
            return electionList;
        }

        public static List<ElectionStatus> GetElectionStatus()
        {
            var electionList = new List<ElectionStatus>();

            try
            {
                electionList= m_merkezDC.ElectionStatus.ToList();
            }
            catch (Exception)
            {
                
            }
            return electionList;
        }
        public static List<ElectionStatus> GetElectionStatusById(int ElectionId)
        {
            var electionList = new List<ElectionStatus>();

            try
            {
                foreach (var item in m_merkezDC.ElectionStatus.ToList())
                {
                    if (! m_merkezDC.ElectionDetails.Any(x => x.ElectionId == ElectionId && x.StatusId == item.StatusId))
                    {
                        electionList.Add(item);
                    }
                }
            }
            catch (Exception)
            {
                
            }
            return electionList;
        }

        public static List<Party> GetParties()
        {
            var partyList = new List<Party>();

            try
            {
               partyList= m_internetDc.Parties.ToList();
            }
            catch (Exception)
            {
            }
            return m_internetDc.Parties.ToList();
        }

        public static List<Region> GetRegions()
        {
            var regionList = new List<Region>();
            try
            {
                regionList=m_merkezDC.Regions.ToList();
            }
            catch (Exception)
            {
            }
            return regionList;
        }

        public static List<Candidate> GetCandidates()
        {
            var candidateList = new List<Candidate>();
            try
            {
                candidateList=m_internetDc.Candidates.ToList();
            }
            catch (Exception)
            {
                
            }
            return candidateList;
        }

        public static List<Voter> GetVoters()
        {
            var voterList = new List<Voter>();
            try
            {
                voterList = m_internetDc.Voters.ToList();
            }
            catch (Exception)
            {
            }
            return voterList;
        }

        public static List<Department> GetDepartments()
        {
            return m_merkezDC.Departments.ToList();
        }

        public static List<UserType> GetUserTypes()
        {
            return m_merkezDC.UserTypes.ToList();
        }




    }
}