using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace lab02
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            CurrentProcList = new List<Proc>();
        }
        public List<Proc> CurrentProcList { get; private set; }
        public System.Windows.Forms.TextBox TextBoxMaker => this.textBox1;
        public System.Windows.Forms.TextBox TextBoxSeria => this.textBox2;
        public System.Windows.Forms.TextBox TextBoxModel => this.textBox3;
        public System.Windows.Forms.TextBox TextBoxYadra => this.textBox6;
        public System.Windows.Forms.TextBox TextBoxChast => this.textBox5;
        public System.Windows.Forms.TextBox TextBoxRazr => this.textBox4;
        public System.Windows.Forms.TextBox TextBoxRaz => this.textBox7;
        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (textBox1.Text.Length > 10 || textBox2.Text.Length > 10 || textBox3.Text.Length > 10 || textBox4.Text.Length > 10 || textBox5.Text.Length > 10 || textBox6.Text.Length > 10 || textBox7.Text.Length > 10)
                    throw new Exception("входные данные должны быть меньше");
                if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || textBox5.Text == "" || textBox6.Text == "" || textBox7.Text == "")
                    throw new NullReferenceException();

                string maker = textBox1.Text;
                string seria = textBox2.Text;
                string model = textBox3.Text;
                string yadra = textBox1.Text;
                string chast = textBox2.Text;
                string razr = textBox3.Text;
                string raz = textBox7.Text;

                var newProc = new Proc(maker,seria,model,yadra,chast,razr,raz);
                CurrentProcList.Add(newProc);
                listBox12.Items.Add(newProc);
            }
            catch (NullReferenceException)
            {
                MessageBox.Show("все заполните");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void Clear()
        {
            CurrentProcList.Clear();
            listBox12.Items.Clear();
            foreach (Control c in Controls)
            {
                if (c.GetType() == typeof(GroupBox))
                    foreach (Control d in c.Controls)
                        if (d.GetType() == typeof(System.Windows.Forms.TextBox))
                            d.Text = string.Empty;

                if (c.GetType() == typeof(System.Windows.Forms.TextBox))
                    c.Text = string.Empty;
            }
        }
        public void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 32) return;
            e.Handled = true;
        }
        public void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 32) return;
            e.Handled = true;
        }
        public void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 32) return;
            e.Handled = true;
        }

        public void textBox6_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 32) return;
            e.Handled = true;
        }
        public void textBox5_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 32) return;
            e.Handled = true;
        }
        public void textBox4_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 32) return;
            e.Handled = true;
        }
        public void textBox7_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsLetter(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 32) return;
            e.Handled = true;
        }
    }
}
