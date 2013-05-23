using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace EOS.FingerPrintReader
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            clearLog();
            getBiometricId();
        }
        private void clearLog()
        {
            this.Hide();
            axSBXPC1.DotNET();
            var ip = "192.168.1.224";
            var password = 12345678;
            var data = axSBXPC1.ConnectTcpip(1, ref ip, 5005, 12345678);

            //var data = axSBXPC1.ConnectTcpip(1, ref ip, 5005, 12345678);
            var generalData = axSBXPC1.ReadGeneralLogData(1);

            int dwTMachineNumber = 0;
            int dwEnrollNumber = 0;
            int dwEMachineNumber = 0;
            int dwVerifyMode = 0;
            int dwYear = 0;
            int dwMonth = 0;
            int dwDay = 0;
            int dwHour = 0;
            int dwMinute = 0;
            int dwSecond = 0;

            var general = axSBXPC1.GetGeneralLogData(1,
                                                     ref dwTMachineNumber,
                                                     ref dwEnrollNumber,
                                                     ref dwEMachineNumber,
                                                     ref dwVerifyMode,
                                                     ref dwYear,
                                                     ref dwMonth,
                                                     ref dwDay,
                                                     ref dwHour,
                                                     ref dwMinute,
                                                     ref dwSecond);
        }
        private void getBiometricId()
        {
            this.Hide();
            axSBXPC1.DotNET();
            var ip = "192.168.1.224";
            var password = 12345678;
            var data = axSBXPC1.ConnectTcpip(1, ref ip, 5005, 12345678);

            while (true)
            {
                Thread.Sleep(3000);
                //var data = axSBXPC1.ConnectTcpip(1, ref ip, 5005, 12345678);
                var generalData = axSBXPC1.ReadGeneralLogData(1);

                int dwTMachineNumber = 0;
                int dwEnrollNumber = 0;
                int dwEMachineNumber = 0;
                int dwVerifyMode = 0;
                int dwYear = 0;
                int dwMonth = 0;
                int dwDay = 0;
                int dwHour = 0;
                int dwMinute = 0;
                int dwSecond = 0;

                var general = axSBXPC1.GetGeneralLogData(1,
                                                         ref dwTMachineNumber,
                                                         ref dwEnrollNumber,
                                                         ref dwEMachineNumber,
                                                         ref dwVerifyMode,
                                                         ref dwYear,
                                                         ref dwMonth,
                                                         ref dwDay,
                                                         ref dwHour,
                                                         ref dwMinute,
                                                         ref dwSecond);
                if (general)
                {
                    sendData(dwEnrollNumber);
                }

            }
        }

        private void sendData(int Id)
        {
            try
            {
                var client = new TcpClient();
                client.Connect("localhost", 8500);

                NetworkStream stream;

                stream = client.GetStream();
                var bytes = Encoding.ASCII.GetBytes(Id.ToString());

                stream.Write(bytes, 0, bytes.Length);
                stream.Flush();

                stream.Close();
                client.Close();


            }
            catch (Exception)
            { }
        }
        private void MainForm_Load(object o, EventArgs e)
        {

        }
    }
}
