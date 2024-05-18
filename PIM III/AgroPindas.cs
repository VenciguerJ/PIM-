using User_Assets;
using System;
using Database_Config;

namespace Main
{

    public class Menus
    {
        public static User Login()
        {
            int resp = 0;
            User user = null;
            do
            {
                Console.WriteLine("LOGIN!");

                Console.WriteLine("Deseja Entrar com um usuário já criado ou crirar um usuário?\n\n 1 - Entrar | 2 - Crirar um usuário");

                resp = int.Parse(Console.ReadLine());

                if (resp == 1)
                {
                    User tempUser = User.Login();
                    user = tempUser;
                }
                else if (resp == 2)
                {
                    User tempUser = User.CreateUser();
                    user = tempUser;
                }
                else
                {
                    Console.WriteLine("entrada inválida\n");
                    Console.WriteLine("Pressione Enter para tentar novamente!");
                    Console.ReadLine();
                    Console.Clear();
                    return null;
                }
            } while (user == null);
            return user;
        }
    }

    class Mainprogram
    {
        static void Main(string[] args)
        {
            User loggedUser = Menus.Login();

            Console.Clear();
            Console.WriteLine("Login Feito");
            loggedUser.ShowUser();
        }

    }
} 