namespace Fornecedores_config
{
    public class Fornecedor
    {
        private double cnpj;
        public double CNPJ
        {
            get { return cnpj; }
            set { cnpj = value; }
        }

        private string razaoSocial;
        public string RazaoSocial
        {
            get { return razaoSocial; }
            set { razaoSocial = value; }
        }

        private string endereco;
        public string Endereco
        {
            get { return endereco; }
            set { endereco = value; }
        }

        public Fornecedor CreateFornecedor()
        {
            Console.WriteLine("CADASTRO DE UM NOVO FORNECEDOR\n\n");

            Console.WriteLine("Informe a razão social do fornecedor");
            string tmpRazao = Console.ReadLine();

            Console.WriteLine("Informe o CNPJ fornecedor");
            double tmpCnpj = double.Parse(Console.ReadLine());

            Fornecedor tmpFornecedor = new Fornecedor(tmpCnpj, tmpRazao);

            Console.WriteLine("Cadastro concluído com sucesso!");
            return tmpFornecedor;
        }

        public Fornecedor(double cnpj2, string nome, string end)
        {
            CNPJ = cnpj2;
            RazaoSocial = nome;
            Endereco = end;
        }

        public Fornecedor(double cnpj2, string nome)
        {
            CNPJ = cnpj2;
            RazaoSocial = nome;
        }

    }
}