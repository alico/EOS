using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Security.Cryptography;

namespace EOS.InternetService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    public class InternetService : IInternetService
    {
        private string pass = "123456";
        private VoteDataContext m_internetDc;
        public string SetVote(string identityNo, int electionId, int RegionId, string District, string timeStampt, string hashingData)
        {
            if (Hash(pass + timeStampt) == hashingData)
            {
                try
                {
                    m_internetDc = new VoteDataContext(Globals.ConnectionString);
                    var vote = new VoteDetail();
                    if (m_internetDc.Districts.Any(x => x.DistrictName == District))
                    {
                        vote.DistrictId = m_internetDc.Districts.First(x => x.DistrictName == District).DistrictId;
                        vote.ElectionId = electionId;
                        vote.IdentityNo = identityNo;
                        vote.RegionId = RegionId;
                        vote.VotingDate = DateTime.Now;
                        m_internetDc.VoteDetails.InsertOnSubmit(vote);
                        m_internetDc.SubmitChanges();
                        return "Succeeded";
                    }
                    else
                        return "Error:Voter informationsnot correct!";
                }
                catch (Exception ex)
                {
                    return "Error";
                }
            }
            return "Not Authorized!";
        }

        public VoterResponse GetVoter(string biometricId, int electionId,string timeStampt, string hashingData)
        {
            var response = new VoterResponse();
            if (Hash(pass + timeStampt) == hashingData)
            {
                try
                {
                    m_internetDc = new VoteDataContext(Globals.ConnectionString);
                    if (m_internetDc.Voters.Any(x => x.BiometricPath == biometricId))
                    {
                        if (m_internetDc.Voters.Any(x => x.BiometricPath == biometricId))
                        {
                            Voter voter = m_internetDc.Voters.First(x => x.BiometricPath == biometricId);
                            if (!m_internetDc.VoteDetails.Any(j => j.IdentityNo == voter.IdentityNo && j.ElectionId == electionId))
                            {
                                response.Data = m_internetDc.Voters.First(x => x.BiometricPath == biometricId);
                            }
                            else
                            {
                                response.Error = new Error();
                                response.Error.ErrorMessage = "EXIST_VOTER";
                                response.Error.ErrorCode = "1";
                            }
                        }
                        else
                        {
                            response.Error = new Error();
                            response.Error.ErrorMessage = "NOT_EXIST_VOTER";
                            response.Error.ErrorCode = "2";
                        }

                    }
                }
                catch (Exception ex)
                {
                    response.Error = new Error();
                    response.Error.ErrorMessage = "SERVER_ERROR";
                    response.Error.ErrorCode = "3";
                }
            }
            return response;
        }

        public CandidateResponse GetCandidates(int electionId, string identityNo, string timeStampt, string hashingData)
        {
            var response = new CandidateResponse();
            if (Hash(pass + timeStampt) == hashingData)
            {
                try
                {
                    m_internetDc = new VoteDataContext(Globals.ConnectionString);
                    if (m_internetDc.Voters.Any(x => x.IdentityNo == identityNo))
                    {
                        int regionId = m_internetDc.Voters.First(x => x.IdentityNo == identityNo).RegionId.Value;
                        if (m_internetDc.VVoterMachineCandidates.Any(x => x.ElectionId == electionId && x.RegionId == regionId))
                        {
                            response.Candidates = m_internetDc.VVoterMachineCandidates.Where(x => x.ElectionId == electionId && x.RegionId == regionId).ToList();
                        }
                        response.Parties = m_internetDc.VVoterMachineParties.ToList();
                    }
                }
                catch (Exception ex)
                {
                    response.Error = new Error();
                    response.Error.ErrorMessage = "ERROR";
                    response.Error.ErrorCode = "2";
                }
            }
            else
            {
                response.Error = new Error();
                response.Error.ErrorMessage = "NOT_AUTHROZIED";
                response.Error.ErrorCode = "3";
            }
            return response;

        }
        
        public string SetFingerPrint(string IdentityNo, string BiometricId, string Password)
        {
            var result = string.Empty;
            try
            {
                if (Password == "123456")
                {
                    m_internetDc = new VoteDataContext(Globals.ConnectionString);
                    if (m_internetDc.Voters.Any(x => x.IdentityNo == IdentityNo) && !string.IsNullOrEmpty(BiometricId))
                    {
                        var voter = m_internetDc.Voters.First(x => x.IdentityNo == IdentityNo);
                        voter.BiometricPath = BiometricId;
                        m_internetDc.SubmitChanges();
                        result = "Succeeded";
                    }
                    else
                    {
                        result = "No Data Found!";
                    }
                }
                else
                {
                    result = "Not Authorized!";
                }
            }
            catch (Exception)
            {
                result = "Error!";
            }

            return result;
        }

        private static string Hash(string data)
        {
            MD5CryptoServiceProvider alg = new MD5CryptoServiceProvider();
            byte[] byteValue = System.Text.Encoding.UTF8.GetBytes(data);
            byte[] hashingByte = alg.ComputeHash(byteValue);
            return Convert.ToBase64String(hashingByte);
        }
    }
}
