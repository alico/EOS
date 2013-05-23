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
using System.IO;

namespace VotingMachine
{
    public partial class PartyUserControl : UserControl
    {
        MainWindow m_mainWindow;
        public readonly PartyModel m_ParyModel;

        public PartyUserControl(PartyModel partyModel)
        {
            InitializeComponent();
            prepareParty(partyModel);
            m_ParyModel = partyModel;
        }

        private void StackPanelMouseDown(object sender, MouseButtonEventArgs e)
        {
        }

        private void prepareParty(PartyModel partyModel)
        {
            try
            {
                if (partyModel != null && partyModel.Candidates != null && partyModel.Party != null)
                {

                    byte[] data = partyModel.Party.Image.Bytes.ToArray();
                        
                    MemoryStream strm = new MemoryStream();

                    strm.Write(data, 0, data.Length);

                    strm.Position = 0;

                    var img = System.Drawing.Image.FromStream(strm);

                    BitmapImage bi = new BitmapImage();

                    bi.BeginInit();

                    MemoryStream ms = new MemoryStream();

                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);

                    ms.Seek(0, SeekOrigin.Begin);

                    bi.StreamSource = ms;

                    bi.EndInit();

                    //imagebox.Source = bi;
                    PartyImage.Source = bi;
                    PartyAcr.Text = partyModel.Party.PartyAcr;
                    PartyManager.Text = partyModel.Party.Name + " " + partyModel.Party.Surname;
                    PartyName.Text = partyModel.Party.PartyName;

                    foreach (var candidate in partyModel.Candidates.OrderBy(x => x.OrderNo))
                    {
                        var textblock = new TextBlock();
                        textblock.Padding = new Thickness(10, 0, 0, 0);
                        textblock.Text = candidate.OrderNo + ") " + candidate.Name + " " + candidate.Surname;
                        textblock.TextWrapping = TextWrapping.Wrap;
                        partyStackPanel.Children.Add(textblock);
                    }
                    
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
                
            }
        }


    }

}
