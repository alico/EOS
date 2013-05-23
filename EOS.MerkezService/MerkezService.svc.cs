using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Security.Cryptography;

namespace EOS.MerkezService
{
    public class MerkezService : IMerkezService
    {
        private static string Hash(string data)
        {
            MD5CryptoServiceProvider alg = new MD5CryptoServiceProvider();
            byte[] byteValue = System.Text.Encoding.UTF8.GetBytes(data);
            byte[] hashingByte = alg.ComputeHash(byteValue);
            return Convert.ToBase64String(hashingByte);
        }
        #region MerkezService Members

        private VoteDataContext m_voteDc;

        public SetVoteResult SetVote(int electionId, int regionId, string district, int partyId, int usedFrom, string timeStamp, string hashingData)
        {
            var result = new SetVoteResult();
            string pass = "123456";
            if (Hash(pass + timeStamp) == hashingData)
            {
                try
                {
                    m_voteDc = new VoteDataContext(Globals.ConnectionString);
                    if (m_voteDc.Districts.Any(x => x.DistrictName == district))
                    {
                        var vote = new Vote();
                        var trackingCode = createTrackingCode();
                        vote.DistrictId = m_voteDc.Districts.First(x => x.DistrictName == district).DistrictId;
                        vote.ElectionId = electionId;
                        vote.RegionId = regionId;
                        vote.PartyId = partyId;
                        vote.VoteStatus = false;
                        vote.UsedFrom = usedFrom;
                        vote.UsedAt = DateTime.Now;
                        vote.TrackingCode = trackingCode;
                        m_voteDc.Votes.InsertOnSubmit(vote);
                        m_voteDc.SubmitChanges();
                        result.AckCode = "Succeeded";
                        result.TrackingCode = trackingCode.ToString();

                    }
                    else
                    {
                        result.AckCode = "Failure";
                        result.Error = new Error();
                        result.Error.ErrorCode = "1";
                        result.Error.ErrorMessage = "Error:Voter informations not correct!";
                    }

                }
                catch (Exception ex)
                {
                    result.AckCode = "Failure";
                    result.Error = new Error();
                    result.Error.ErrorCode = "2";
                    result.Error.ErrorMessage = "Error:Internal server error!";
                }
            }
            else
            {
                result.AckCode = "Failure";
                result.Error = new Error();
                result.Error.ErrorCode = "3";
                result.Error.ErrorMessage = "Error:Not authorized!";
            }
            return result;
            //return "Not Authorized!";
        }
        
        public VElectionDetail GetActiveElection()
        {
            VElectionDetail election = null;
            try
            {
                m_voteDc = new VoteDataContext(Globals.ConnectionString);
                var elc = m_voteDc.VElectionDetails.ToList();
                if (m_voteDc.VElectionDetails.Any(e => e.StatusName == "Seçim Başlatıldı" && e.StartDate.Value.Date == DateTime.Now.Date && e.FinishDate.Value >= DateTime.Now))
                {
                    election = m_voteDc.VElectionDetails.First(e => e.StatusName == "Seçim Başlatıldı" && e.StartDate.Value.Date == DateTime.Now.Date && e.FinishDate.Value >= DateTime.Now);
                }

            }
            catch (Exception ex)
            {}
            return election;
        }

        public DateTime GetServerDate()
        {
            var date = DateTime.Now;
            return date;
        }
        
        private int createTrackingCode()
        {
            int min = 1134;
            int max = 9898;
            int trackingCode=0;
            m_voteDc = new VoteDataContext(Globals.ConnectionString);
            var random = new Random();
            while (true)
            {
                trackingCode=random.Next(min, max);
                if (!m_voteDc.Votes.Any(x => x.TrackingCode.Value == trackingCode))
                {
                    return trackingCode;
                }
            }
            return 0;
        }

        #endregion
    }
}
