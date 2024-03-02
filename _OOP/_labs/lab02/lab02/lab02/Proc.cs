using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab02
{
    public class Proc
    {
        public string maker { get; set; }
        public string seria { get; set; }
        public string model { get; set; }
        public string yadra { get; set; }
        public string chast { get; set; }
        public string razr { get; set; }
        public string raz { get; set; }

        public Proc(string Maker, string Seria, string Model, string Yadra, string Chast, string Razr, string Raz)
        {
            maker = Maker;
            seria = Seria;
            model = Model;
            yadra = Yadra;
            chast = Chast;
            razr = Razr;
            raz = Raz;
        }
        public override string ToString()
        {
            return $"Произв.: {maker}, Серия: {seria}, Мод.: {model}, Ядр.: {yadra}, Част: {chast}, Разр.: {razr}, Размер: {raz}";
        }
    }
}
