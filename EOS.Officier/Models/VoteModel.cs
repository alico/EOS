using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EOS.Officier.Models
{
    public class VoteModel
    {
        private EOSInternetDataContext m_internetDc = new EOSInternetDataContext(Globals.InternetConnectionString);
        private ESSMerkezDataContext m_merkezDc = new ESSMerkezDataContext(Globals.MerkezConnectionString);
        public Election Election { get; set; }
        public Region Region { get; set; }
        public District District { get; set; }
        public DateTime VotingDate;
        public Voter Voter;
        public VoteModel(VoteDetail VoteDetail)
        {
            try
            {
                Voter = m_internetDc.Voters.First(v => v.IdentityNo == VoteDetail.IdentityNo);
                Election = m_merkezDc.Elections.First(e => e.ElectionId == VoteDetail.ElectionId);
                Region = m_merkezDc.Regions.First(r => r.RegionId == VoteDetail.RegionId.Value);
                District = m_merkezDc.Districts.First(d => d.DistrictId == VoteDetail.DistrictId.Value);
                VotingDate = VoteDetail.VotingDate.Value;
            }
            catch (Exception)
            {
            }
         
        }
    }
}
