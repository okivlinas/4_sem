using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace lab01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ves = textBox1.Text;
            bool containsOnlyDigits1 = ves.All(char.IsDigit);
            string rost = textBox2.Text;
            bool containsOnlyDigits2 = rost.All(char.IsDigit);
            string vozrast = textBox3.Text;
            bool containsOnlyDigits3 = vozrast.All(char.IsDigit);
            string zhelVes = textBox6.Text;
            bool containsOnlyDigits4 = zhelVes.All(char.IsDigit);
            string srok = textBox7.Text;
            bool containsOnlyDigits5 = srok.All(char.IsDigit);

            if((radioButton1.Checked || radioButton2.Checked) && ((radioButton3.Checked || radioButton4.Checked) || radioButton5.Checked) && containsOnlyDigits1 == true && containsOnlyDigits2 == true && containsOnlyDigits3 == true && containsOnlyDigits4 == true && containsOnlyDigits5 == true)
            {

                double ves1 = Convert.ToDouble(ves);
                double rost1 = Convert.ToDouble(rost);
                double vozrast1 = Convert.ToDouble(vozrast);
                double zhelVes1 = Convert.ToDouble(zhelVes);
                double srok1 = Convert.ToDouble(srok);

                double imt = ves1 / (rost1 * rost1 / 10000);

                if (radioButton3.Checked)
                {
                    zhelVes1 = ves1;
                }
                else if (radioButton4.Checked)
                {
                    zhelVes1 = ves1 * 0.9;
                }
                else if (radioButton5.Checked)
                {
                    zhelVes1 = ves1 * 1.1;
                }

                double BOV = 0;

                if (radioButton1.Checked)
                {
                    BOV = 88.362 + (13.397 * zhelVes1) + (4.799 * rost1) - (5.677 * vozrast1);
                }
                else if (radioButton2.Checked)
                {
                    BOV = 447.593 + (9.247 * zhelVes1) + (3.098 * rost1) - (4.330 * vozrast1);
                }

                double normKal;

                if (imt < 18.5)
                {
                    textBox4.Text = "Низкий вес";
                    normKal = BOV * 1.2;
                }
                else if (imt < 25)
                {
                    textBox4.Text = "Нормальный вес";
                    normKal = BOV;
                }
                else
                {
                    textBox4.Text = "Ожирение";
                    normKal = BOV * 0.8;
                }

                double obskKolKal = normKal * srok1;

                double kalDZhelVes = obskKolKal / srok1;

                string kalDZhelVes1 = Convert.ToString(kalDZhelVes);
                textBox5.Text = kalDZhelVes1;
            }
            else
            {
                textBox4.Text = "Все поля должны быть";
                textBox5.Text = "заполнены правильно!";
            }

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label7_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
