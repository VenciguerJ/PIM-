using System;
using Database_Config;

namespace User_Assets
{
    public class User
    {
        private string nome;
        public string Nome
        {
            get { return nome; }
            set
            {
                const int MAX_CARACTERES_DATABASE = 99;
                if (value.Length > MAX_CARACTERES_DATABASE)
                {
                    Console.WriteLine($"Nome muito grande! Defina um nome com no máximo {MAX_CARACTERES_DATABASE} caracteres.");
                }
                else
                {
                    nome = value;
                }
            }
        }

        private string username;
        public string Username
        {
            get { return username; }
            set { username = value; }//validar aqui se não existe nenhum usuário com o nome no banco de dados.
        }

        private string password;
        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public static User CreateUser()
        {
            Console.WriteLine("CADASTRO DE USUÁRIO\n\n\n");
            Console.WriteLine("Informe o nome do usuário:");
            string tmpNome = Console.ReadLine();
            Console.WriteLine("Informe o username:");
            string tmpUsername = Console.ReadLine();
            Console.WriteLine("Informe a senha:");
            string password = Console.ReadLine();

            User tmpUser = new User(tmpNome, tmpUsername, password);

            Database.RegisterUserOnDB(tmpUser);

            return tmpUser;
        }

        public void ShowUser()
        {
            Console.WriteLine($"Mostrando informações do usuário\n " +
                $"Nome:  [{Nome}]" +
                $"Username: [{Username}]");
        }

        public User(string nome, string username, string password)
        {
            Nome = nome;
            Username = username;
            Password = password;
        }
        
        public class DBUser
        {
            private readonly string connectionString = "";
            public static void DB_CreateUser(User tmpUser)
            {
                
            }
        }
    }

}
