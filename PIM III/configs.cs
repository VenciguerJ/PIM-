using System;
using Database_Config;

namespace General_configs
{
    class Configs
    {
        public static void ConfigMenu()
        {
            Console.WriteLine("Inicio das configura��es!");
        }

        public static void ConfigPlantio()
        {
            //colocar aqui um tipo de temperatura que aparecer� no cadastro do produto.
             int typeTemp = DBConfig.ConsultaTipoTemperatura(); 
        }
    }
}