using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace EOS.InternetService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IInternetService
    {
        [OperationContract(Action = "http://192.168.1.222:5778/InternetService/SetVote")]
        string SetVote(string identityNo, int electionId, int RegionId, string District, string timeStampt, string hashingData);

        [OperationContract(Action = "http://192.168.1.222:5778/InternetService/GetVoter")]
        VoterResponse GetVoter(string biometricId,int electionId, string timeStampt, string hashingData);

        [OperationContract(Action = "http://192.168.1.222:5778/InternetService/GetCandidates")]
        CandidateResponse GetCandidates(int electionId, string identityNo, string timeStampt, string hashingData);

        [OperationContract(Action = "http://192.168.1.222:5778/InternetService/SetFingerPrint")]
        string SetFingerPrint(string IdentityNo, string BiometricId, string Password);
    }

}

