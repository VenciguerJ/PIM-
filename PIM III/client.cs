using System;

namespace Client_Config
{
    public class Client
    {
        public int ID { get; set; }
        
        private string name; 
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private double cpf;
        public double CPF
        {
            get { return cpf; }
            set { cpf = value; }
        }

        private double phoneNumber;
        public double PhoneNumber { get; set; }

        public Boolean Assinante { get; set; }

        static Client CreateClient()
        {
            Console.WriteLine("CADASTRO DE NOVO CLIENTE\n\n\n");
            Console.WriteLine("Informe o nome do cliente: ");
            string tmpName = Console.ReadLine();
            Console.WriteLine("\n\nAgora informe o CPF no cliente: ");
            double tmpCPF = double.Parse(Console.ReadLine());
            Console.WriteLine("\n\nInforme também um telefone de contato docliente: ");
            double tmpTel = double.Parse(Console.ReadLine());

            Client tmpClient = new Client(tmpName, tmpCPF, tmpTel);
            
            //função pra cadastrar no banco, ver se já existe cliente no banco e etc...
            return tmpClient;

        }
        
        public Client(string nome, double cpf, double Telefone)
        {
            Name = nome;
            CPF = cpf;
            PhoneNumber = Telefone;
            Assinante = false;
        }
    }
}
