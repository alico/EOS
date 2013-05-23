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
    /// Interaction logic for Step2UserControl.xaml
    /// </summary>
    public partial class Step2UserControl : UserControl
    {
        private MainWindow m_mainWindow;

        public Step2UserControl(MainWindow mainWindow)
        {
            InitializeComponent();
            m_mainWindow = mainWindow;
            prepareForm();
        }

        private void prepareForm()
        {
            try
            {
                var timeStamp = Globals.GetUnixTimeStamp();
                var hash = Globals.Hash(Globals.Password + timeStamp);
                var service = Globals.GetService("Internet", "GetCandidates") as InternetService.IInternetService;
                
                var electionInstruments = service.GetCandidates(Globals.CurrentElection.ElectionId, Globals.CurrentVoter.IdentityNo, timeStamp, hash);
                if (electionInstruments != null)
                {
                    var parties = electionInstruments.Parties.ToList();
                    var displayingParties = new List<PartyModel>();
                    foreach (var party in parties)
                    {
                        var partyModel = new PartyModel();
                        partyModel.Party = party;
                        if (electionInstruments.Candidates.Any(x => x.PartyId == party.PartyId))
                        {
                            var candidates = electionInstruments.Candidates.Where(x => x.PartyId == party.PartyId).ToList();
                            partyModel.Candidates = new List<InternetService.VVoterMachineCandidate>();
                            foreach (var candidate in candidates)
                            {
                                partyModel.Candidates.Add(candidate);
                            }
                            displayingParties.Add(partyModel);
                        }
                    }
                    prepareParties(displayingParties);
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void prepareParties(List<PartyModel> parties)
        {
            try
            {
                if (parties != null && parties.Count > 0)
                {
                    mainStackPanel.Children.Clear();
                    mainStackPanel.Orientation = Orientation.Horizontal;
                    foreach (var partyItem in parties)
                    {
                        var partyUserControl = new PartyUserControl(partyItem);
                        partyUserControl.MouseDown += new MouseButtonEventHandler(partyVoted);
                        mainStackPanel.Children.Add(partyUserControl);
                    }

                }
            }
            catch (Exception ex)
            {
                
            }
        }

        private void partyVoted(object o, MouseButtonEventArgs e)
        {
            try
            {
                var votedParty = e.Source as PartyUserControl;
                if (votedParty != null)
                {
                    Globals.CurrentParty = votedParty.m_ParyModel;
                    m_mainWindow.changeStep(3);
                }
            }
            catch (Exception)
            {

            }
           

        }

      
    }
}
