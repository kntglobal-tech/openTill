﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace openTill.GUI
{
	/// <summary>
	/// Interaction logic for MainWindow.xaml
	/// </summary>
	public partial class MainWindow : Window
	{
		public MainWindow()
		{
			InitializeComponent();
		}

		private void btnInventory_Click(object sender, RoutedEventArgs e)
		{
			ManageInventory mi = new ManageInventory();

			mi.ShowDialog();
		}

		private void btnPriceOverride_Click(object sender, RoutedEventArgs e)
		{
			enterPin newPin = new enterPin();

			newPin.ShowDialog();
		}

		private void btnNoScan_Click(object sender, RoutedEventArgs e)
		{
			
		}
	}
}
