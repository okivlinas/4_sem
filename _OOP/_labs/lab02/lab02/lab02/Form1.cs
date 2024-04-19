using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using Newtonsoft.Json;

namespace lab02
{
    public partial class Form1 : Form
    {
        //экземпляр второй формы
        public readonly Form2 _procForm = new Form2();

        public Form1()
        {
            InitializeComponent();
            //скрытие формы
            _procForm.Hide();
        }


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            _procForm.ShowDialog();
        }

        private void maskedTextBox1_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (_procForm.CurrentProcList == null) return;

            var type = "";
            var videocard = "";
            decimal ram = 0;
            decimal hdd = 0;
            var date = "";
            var format = TypeDDR.DDR4;

            try
            {
                if (Controls.OfType<RadioButton>().Any(r => r.Checked) == false || comboBox1.Text == "" || comboBox3.Text == "" || numericUpDown2.Text == "" || comboBox4.Text == "" || maskedTextBox1.Text == "" || numericUpDown1.Text == "")
                    throw new Exception("Заполните поля!");

                type = comboBox1.Text;
                videocard = comboBox3.Text;
                ram = numericUpDown1.Value;
                hdd = numericUpDown2.Value;
                date = maskedTextBox1.Text;

                var checkedRadioButton = Controls.OfType<RadioButton>().First(r => r.Checked);
                switch (checkedRadioButton.Name)
                {
                    case "radioButton1":
                        format =TypeDDR.DDR2;
                        break;
                    case "radioButton2":
                        format = TypeDDR.DDR3;
                        break;
                    case "radioButtonF3":
                        format = TypeDDR.DDR4;
                        break;
                }
            }
            catch (OverflowException)
            {
                MessageBox.Show("сильно большие цифры");
                return;
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
                return;
            }

            var procList = new List<Proc>(_procForm.CurrentProcList);
            if (_procForm.TextBoxMaker.Text == "" && _procForm.TextBoxModel.Text == "" && _procForm.TextBoxRaz.Text == "" && _procForm.TextBoxYadra.Text == "" && _procForm.TextBoxSeria.Text == "" && _procForm.TextBoxRazr.Text == "" && _procForm.TextBoxChast.Text == "")
            {
                MessageBox.Show("пж, заполните информацию о процессоре!");
                return;
            }
            var pcFile = new PC(format, type, videocard, ram, hdd, date, _procForm.TextBoxMaker.Text, _procForm.TextBoxSeria.Text, _procForm.TextBoxModel.Text, _procForm.TextBoxYadra.Text, _procForm.TextBoxChast.Text, _procForm.TextBoxRazr.Text, _procForm.TextBoxRaz.Text);
            listBox1.Items.Add(pcFile);
            _procForm.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var PCList = (from object item in listBox1.Items select item as PC).ToList();

            using (var reader = new StreamWriter(@"D:\Документы\_study\_university\4_sem\_OOP\_labs\lab02\JSON\Lab2.json"))
            {
                string jsonString = JsonConvert.SerializeObject(PCList);
                reader.Write(jsonString);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            var PCList = new List<PC>();
            using (var reader = new StreamReader(@"D:\Документы\_study\_university\4_sem\_OOP\_labs\lab02\JSON\Lab2.json"))
            {
                PCList = JsonConvert.DeserializeObject<List<PC>>(reader.ReadToEnd());
            }

            foreach (var bookFile in PCList)
                listBox1.Items.Add(bookFile);
        }
    }
}
