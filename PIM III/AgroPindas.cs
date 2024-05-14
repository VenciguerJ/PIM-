using User_Assets;
using System;

namespace Main
{
    class Mainprogram
    {
        static void Main(string[] args)
        {
            Console.WriteLine("testge");
            User tmpUser = User.CreateUser();
            tmpUser.ShowUser();
        }

    }
} 