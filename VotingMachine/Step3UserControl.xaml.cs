using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace VotingMachine
{
    /// <summary>
    /// Interaction logic for Step3UserControl.xaml
    /// </summary>
    public partial class Step3UserControl : UserControl
    {
        private MainWindow m_mainWindow;
        public Step3UserControl(MainWindow mainWindow)
        {
            InitializeComponent();
            m_mainWindow = mainWindow;
            prepareForm();
            
        }

        private void prepareForm()
        {

            if (Globals.CurrentParty != null)
            {
                //mainStackPanel.Children.Clear();
                var partyUserControl = new PartyUserControl(Globals.CurrentParty);
                ChildStack.Children.Add(partyUserControl);
            }
        }

        private void acceptButton_Click(object sender, RoutedEventArgs e)
        {
            var timeStamp = Globals.GetUnixTimeStamp();
            var hashData =  Globals.Hash(Globals.Password+timeStamp);

            var internetService = Globals.GetService("Internet", "SetVote") as InternetService.IInternetService;
            var merkezService = Globals.GetService("Merkez", "SetVote") as MerkezService.IMerkezService;

            var resultMerkez = merkezService.SetVote(Globals.CurrentElection.ElectionId,
                                                       Globals.CurrentVoter.RegionId.Value,
                                                       Globals.CurrentVoter.District,
                                                       Globals.CurrentParty.Party.PartyId,
                                                       1,
                                                       timeStamp,
                                                       hashData);
            if (resultMerkez.AckCode == "Succeeded")
            {
                var result = internetService.SetVote(Globals.CurrentVoter.IdentityNo,
                                            Globals.CurrentElection.ElectionId,
                                            Globals.CurrentParty.Candidates[0].RegionId,
                                            Globals.CurrentVoter.District,
                                            timeStamp,
                                            hashData);
                Globals.CurrenttrackingCode = resultMerkez.TrackingCode;

                m_mainWindow.changeStep(4);
            }


        }

        private void declineButton_Click(object sender, RoutedEventArgs e)
        {
            m_mainWindow.changeStep(2);
        }
    }
}
