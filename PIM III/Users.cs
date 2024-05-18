using Database_Config;
using System;

namespace User_Assets
{
    public class User
    {
        public int ID { get; set; }

        private string nome;
        public string Nome
        {
            get { return nome; }
            set
            {
                const int MAX_CARACTERES_DATABASE = 100;
                if (value.Length > MAX_CARACTERES_DATABASE)
                {
                    throw new Exception($"Nome muito grande! Defina um nome com no máximo {MAX_CARACTERES_DATABASE} caracteres.");
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
            set
            {
                int MAX_CARACTERES_DATABASE = 50;
                if (value.Length > 50)
                {
                    throw new Exception($"Nome muito grande! Defina um nome com no máximo {MAX_CARACTERES_DATABASE} caracteres.");
                }
                username = value;
            }
        }

        private string password;
        public string Password
        {
            get { return password; }
            set {
            int MAX_CARACTERES_DATABASE = 20;
                if (value.Length > 20)
                {
                    throw new Exception("Nome muito grande! Defina um nome com no máximo {MAX_CARACTERES_DATABASE} caracteres.");
                }
                else
                {
                    password = value; 
                }
            }
        }
        public static User Login()
        {
            try
            {
                Console.WriteLine("\nEntrar com Usuário\n");

                Console.WriteLine("Informe o usuário:");
                string tmpUsername = Console.ReadLine();

                Console.WriteLine("Escolha o Usuário");

                List<User> foundedUsers = DBUsers.SearchUsers(tmpUsername);

                if(foundedUsers.Count == 0);
                {
                    Console.WriteLine("Nenhhum usuário encontrado");
                }

                foreach (User user in foundedUsers)
                {
                    user.ShowUser();
                }

                Console.WriteLine("Selecione pelo numero de registro do usuario");
                int tmpNumID = int.Parse(Console.ReadLine());

                User userSelecionado = foundedUsers[tmpNumID - 1];

                Console.WriteLine($"usuário selecionado: {userSelecionado.Username}\n");

                Console.WriteLine("Informe a senha:");
                string tmpSenha = Console.ReadLine();

                if (tmpSenha == userSelecionado.Password)
                {
                    return userSelecionado;
                }
                else
                {
                    Console.WriteLine("Senha incorreta.");
                    return null;
                }
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
            
        }
        public static User CreateUser()
        {
            try
            {
                Console.WriteLine("CADASTRO DE USUÁRIO\n\n");
                Console.WriteLine("Informe o nome do usuário:");
                string tmpNome = Console.ReadLine();
                Console.WriteLine("Informe o username:");
                string tmpUsername = Console.ReadLine();
                Console.WriteLine("Informe a senha:");
                string password = Console.ReadLine();
                User tmpUser = new User(tmpNome, tmpUsername, password);

                DBUsers.CreateUser(tmpUser);

                return tmpUser;
            }
            catch (Exception e)
            {
                Console.WriteLine($"Corrija as seguintes inconsistências: {e.Message}\n\n");
                return null;
            }
            finally
            {
                Console.WriteLine("Usuário cadastrado com sucesso!\n\n");
                Console.WriteLine("Pressione qualquer tecla para sair...");
                Console.ReadKey();
            }
        }

        public void ShowUser()
        {
            Console.WriteLine($"Informações do usuário\n\n " +
                $"N. DE REGISTRO: [{ID}] |  USUARIO: [{Username}]\n" +
                $"Nome:  [{Nome}]\n" +
                $"--------------------------------------------\n\n");
        }

        public User(string nome, string username, string password)
        {
            Nome = nome;
            Username = username;
            Password = password;
        }

        public User(int id, string nome, string username, string pass)
        {
            ID = id;
            Nome = nome;
            Username = username;
            Password = pass;

        }
    }
}
