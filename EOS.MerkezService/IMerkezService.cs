using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace EOS.MerkezService
{
    [ServiceContract]
    public interface IMerkezService
    {
        [OperationContract(Action = "http://192.168.1.222:5779/MerkezService/GetServerDate")]
        DateTime GetServerDate();

        [OperationContract(Action = "http://192.168.1.222:5779/MerkezService/SetVote")]
        SetVoteResult SetVote(int electionId, int regionId, string district, int partyId, int usedFrom, string timeStampt, string hashingData);

        [OperationContract(Action = "http://192.168.1.222:5779/MerkezService/GetActiveElection")]
        VElectionDetail GetActiveElection();
    }

}
