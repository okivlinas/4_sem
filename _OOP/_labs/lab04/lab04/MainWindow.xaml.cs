using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace lab04
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public class Internship
        {
            public string Name { get; set; }
            public string ShortDescription { get; set; }
            public string FullDescription { get; set; }
            public string Category { get; set; }
            public string Duration { get; set; }
        }
        public ObservableCollection<Internship> Internships { get; set; }
        public Internship SelectedInternship { get; set; }
        public string SearchText { get; set; }
        public string SortOption { get; set; }

        public YourWindow()
        {
            InitializeComponent();
            DataContext = this;
            Internships = new ObservableCollection<Internship>(); // Создаем коллекцию для хранения стажировок
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            // Открытие окна для добавления стажировки
            var addInternshipWindow = new AddInternshipWindow();
            if (addInternshipWindow.ShowDialog() == true)
            {
                Internships.Add(addInternshipWindow.Internship);
            }
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            // Открытие окна для редактирования стажировки
            var editInternshipWindow = new EditInternshipWindow(SelectedInternship);
            if (editInternshipWindow.ShowDialog() == true)
            {
                // Обновление выбранной стажировки
                int selectedIndex = Internships.IndexOf(SelectedInternship);
                Internships[selectedIndex] = editInternshipWindow.Internship;
            }
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            // Удаление выбранной стажировки
            if (SelectedInternship != null)
            {
                Internships.Remove(SelectedInternship);
            }
        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            // Обработчик нажатия кнопки "Поиск"
            // Ваш код для выполнения поиска стажировок
        }
    }
}
