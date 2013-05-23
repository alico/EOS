using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EOS.InternetService
{
    public class VoterResponse
    {
        public Error Error { get; set; }
        public Voter Data { get; set; }
    }

    public class Error
    {
        public string ErrorCode { get; set; }
        public string ErrorMessage { get; set; }
    }

    public class CandidateResponse
    {
        public Error Error { get; set; }
        public List<VVoterMachineCandidate> Candidates { get; set; }
        public List<VVoterMachineParty> Parties { get; set; }
    }
  

}