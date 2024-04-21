using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace lab04
{
    public partial class EditInternshipWindow : Window
    {
        public Internship Internship { get; private set; }

        public EditInternshipWindow(Internship internship)
        {
            InitializeComponent();

            // Заполнение элементов управления данными стажировки для редактирования
            nameTextBox.Text = internship.Name;
            shortDescriptionTextBox.Text = internship.ShortDescription;
            fullDescriptionTextBox.Text = internship.FullDescription;
            categoryComboBox.SelectedItem = internship.Category;
            durationTextBox.Text = internship.Duration;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            // Обновление стажировки с введенными данными
            Internship.Name = nameTextBox.Text;
            Internship.ShortDescription = shortDescriptionTextBox.Text;
            Internship.FullDescription = fullDescriptionTextBox.Text;
            Internship.Category = categoryComboBox.SelectedItem.ToString();
            Internship.Duration = durationTextBox.Text;

            DialogResult = true;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
