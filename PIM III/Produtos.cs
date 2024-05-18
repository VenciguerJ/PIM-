using System;
using Database_Config;

namespace Product_Config
{
    public class Product
    {
        public int ID { get; set; }
        public int TipoProd { get; set; }
        public int TemperaturaMaxSuportada { get; set; }
        public int TemperaturaMinSuportada { get; set; }
        public int PrazoVal {  get; set; }
        public int diasParaCultivo { get; set; }

        private string nome;
        public string Nome
        {
            get { return nome; }
            set { nome = value; }
        }

        private decimal price;
        public decimal Price
        {
            get { return price; }
            set { price = value; }
        } 


        public void Altera_tipo()
        {
            Console.WriteLine("Qual seria o novo tipo do produto?\n\nSelecione o >>NUMERO<< do tipo\n\n");

            Console.WriteLine("1 - Mudas\n2 - Embalagens\n 3 - Insumos Agrícolas");

            int newType = int.Parse(Console.ReadLine());

            TipoProd = newType;
        }


        public Product CreateProduct()
        {
            Console.WriteLine("CADASTRO DE NOVO PRODUTO!\n\n");
            Console.WriteLine("Qual é o tipo do produto:");
            int tmpType = int.Parse(Console.ReadLine());
            Console.WriteLine("Qual é o nome do produto:");
            string tmpName = Console.ReadLine();

            Console.WriteLine("Defina o preço do produto:");
            decimal tmpPrice = decimal.Parse(Console.ReadLine());

            Console.WriteLine("Qua é a temperatura máxima para plantio?");
            int tempmax = int.Parse(Console.ReadLine());

            Console.WriteLine("Qua é a temperatura mínima para plantio?");
            int tempmin = int.Parse(Console.ReadLine());

            Console.WriteLine("Quanto tempo é necessário até a muda ficar pronta? (informar o tempo em dias)");
            int tempoCultivo = int.Parse(Console.ReadLine());

            Product tmpProd = new Product(tmpName, tmpType, tmpPrice, tempmax, tempmin, tempoCultivo);

            return tmpProd;

        }

        public Product(string nome, int tipo, decimal price, int tempmax, int tempmin, int tempocultivo)
        {
            Nome = nome;
            TipoProd = tipo;
            Price = price;
            TemperaturaMaxSuportada = tempmax;
            TemperaturaMinSuportada = tempmin;
            diasParaCultivo = tempocultivo;
        }
    }
    //------------------------------------------------------------------------------
    public class Lote
    {
        public int ID { get; set; }
        public int IDProd { get; set; }
        public string Name { get; set; }
        public char SitLote { get; set; }
        public DateTime DataVencimento { get; set; }
        public DateTime DataInclusao { get; set; }

        private int quantidadeLote;
        public int QuantidadeLote
        {
            get { return quantidadeLote; }
            set 
            { 
                if (value < 0)
                {
                    throw new Exception("Não é possível ter quantidade negativa em um lote");   
                }
                else
                {
                    quantidadeLote = value; 
                }
            }
        }

        static Lote CreateLote(Product tmpProd)
        {

            DateTime tmpDataInclusao = DateTime.Now; 

            Console.WriteLine("CADASTRO DE LOTE!\n\n");

            string tmpNomeLote = "";
            Console.WriteLine("Definir nome ou criar nome pa]" +
                "" +
                "drão?\n\n1 - Criar Nome | 2 - Nome Padrão");
            int resp1 = int.Parse(Console.ReadLine());

            if (resp1 != 1 && resp1 != 2)
            {
                Console.WriteLine("Ops... achgo que algo deu errado, operação abortada");
                return null;
            }
            else if (resp1 == 1)
            {
                string resp2;
                do
                {
                    Console.WriteLine("Informe o Nome do Lote");
                    tmpNomeLote = Console.ReadLine();

                    Console.WriteLine($"Confirma {tmpNomeLote} como nome do lote?\n\nS - SIM | N - NÃO");

                    resp2 = Console.ReadLine();

                    if (resp2 != "S" && resp2 != "s" && resp2 != "n" && resp2 != "N")
                    {
                        Console.WriteLine("Ops... achgo que algo deu errado, operação abortada");
                        return null;
                    }
                } while (resp2 != "s" || resp2 != "S");

            }
            else if(resp1 == 2)
            {
                tmpNomeLote = $"Lote - {tmpDataInclusao}"; 
            }

            Console.WriteLine("Informe quantas unidades serão inclusas no lote");
            int tmpQuantidadeLote = int.Parse(Console.ReadLine());

            if (tmpQuantidadeLote <= 0)
            {
                Console.WriteLine("Quantidade deve ser maior que zero! Operação abortada");
                return null;
            }
            else
            {
                Lote tmpLote = new Lote(tmpProd.ID, tmpNomeLote, tmpQuantidadeLote, tmpDataInclusao, tmpProd.PrazoVal);
                DBLotes.DBCreatelote(tmpLote);
                Console.WriteLine($"Lote '{tmpNomeLote}' Criado com sucesso!");
                return tmpLote;
            }
        }


        public Lote(int idprod, string name, int qtd, DateTime datainclusao, int validadeDias )
        {
            IDProd = idprod;
            Name = name;
            QuantidadeLote = qtd;
            DataInclusao = datainclusao;
            DataVencimento = datainclusao.AddDays(validadeDias);
        }

    }
}
