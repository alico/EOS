using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceProcess;
using System.ComponentModel;

namespace EOS.ServiceHost
{
     [RunInstaller(true)]
    public class ServiceHostInstaller : System.Configuration.Install.Installer
    {
       public ServiceHostInstaller()
       {
           var processInstaller = new ServiceProcessInstaller();
           var serviceInstaller = new ServiceInstaller();

           processInstaller.Account = ServiceAccount.LocalSystem;

           serviceInstaller.DisplayName = "EOS.ServiceHost";
           serviceInstaller.StartType = ServiceStartMode.Manual;

           serviceInstaller.ServiceName = "EOS.ServiceHost";

           this.Installers.Add(processInstaller);
           this.Installers.Add(serviceInstaller);
       }

    }
}
