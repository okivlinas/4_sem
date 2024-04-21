using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace lab04
{
    public partial class AddInternshipWindow : MainWindow
    {
        public Internship Internship { get; private set; }

        public AddInternshipWindow()
        {
            InitializeComponent();
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Создание новой стажировки с введенными данными
            Internship = new Internship
            {
                Name = nameTextBox.Text,
                ShortDescription = shortDescriptionTextBox.Text,
                FullDescription = fullDescriptionTextBox.Text,
                Category = categoryComboBox.SelectedItem.ToString(),
                Duration = durationTextBox.Text
            };

            DialogResult = true;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
