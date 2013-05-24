using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Sockets;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;



namespace VotingMachine
{

    public partial class MainWindow : Window
    {
        
        public MainWindow()
        {
            InitializeComponent();
            var uc = new EnteranceUserControl(this);
            MainStackPanel.Children.Add(uc);
          
        }

        private void StackPanelMouseDown(object sender, MouseButtonEventArgs e)
        {
        }

        private void cikisBorder_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MessageBoxResult result = System.Windows.MessageBox.Show("Çıkmak istediğinizden emin misiniz?", "Çıkış", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (result == MessageBoxResult.OK)
                this.Close();
        }
        private void Image_ImageFailed(object sender, ExceptionRoutedEventArgs e)
        {

        }

        public void changeStep(int stepId)
        {       
            MainStackPanel.Children.Clear();
            switch (stepId)
            {
                case 0:
                    {
                        Globals.CurrentElection = null;
                        Globals.CurrentParty = null;
                        Globals.CurrentVoter = null;
                        Globals.CurrenttrackingCode = null;
                        var uc = new EnteranceUserControl(this);
                        MainStackPanel.Children.Add(uc);
                        break;
                    }
                case 1 :
                    {
                        Globals.CurrenttrackingCode = null;
                        var uc = new Step1UserControl(this);
                        MainStackPanel.Children.Add(uc);
                        break;
                    }
                case 2:
                    {
                        var uc = new Step2UserControl(this);
                        MainStackPanel.Children.Add(uc);
                        break;
                    }
                case 3:
                    {
                        var uc = new Step3UserControl(this);
                        MainStackPanel.Children.Add(uc);
                   
                        break;
                    }
                case 4:
                    {
                        Globals.CurrentParty = null;
                        Globals.CurrentVoter = null;
                        var uc = new Step4UserControl(this);
                        MainStackPanel.Children.Add(uc);
                        break;
                    }
            }
        }

    }
}
