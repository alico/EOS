using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Configuration;
namespace TCNufusMudurlugu
{
    [ServiceContract]
    public interface IService1
    {

        [OperationContract(Action = "http://192.168.1.222:9999/TCNufusMudurlugu/GetData")]
        Citizen GetData(string IdentityNo);

        [OperationContract(Action = "http://192.168.1.222:9999/TCNufusMudurlugu/GetCitizens")]
        List<Citizen> GetCitizens();
    }
}
