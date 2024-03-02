using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace lab02
{
    [Serializable]
    public enum TypeDDR
    {
        DDR2,
        DDR3,
        DDR4
    }
    public class PC
    {
        private string type;
        private string videocard;
        private decimal ram;
        private decimal hdd;
        private string date;

        public TypeDDR Format { get; set; }
        public string Type { get; set; }
        public string Videocard { get; set; }
        public decimal Ram { get; set; }
        public decimal Hdd { get; set; }
        public string Date { get; set; }
        public Proc Prossecor { get; set; }

        public PC(TypeDDR format, string type, string videocard, decimal ram, decimal hdd, string date, string maker, string seria, string model, string yadra, string chast, string razr, string raz)
        {
            Format = format;
            Type = type;
            Videocard = videocard;
            Ram = ram;
            Hdd = hdd;
            Date = date;
            Prossecor = new Proc(maker, seria, model, yadra, chast, razr, raz);
        }
        public override string ToString()
        {
            return string.Format("TypeDDR: {6} ,Type: {0} Videocard: {1} Ram: {2} Hdd: {3} Data: {4} Prossecor: {5}", Type, Videocard, Ram, Hdd, Date, Prossecor, Format);
        }
    }
}
