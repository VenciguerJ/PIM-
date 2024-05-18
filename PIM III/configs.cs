using System;
using Database_Config;

namespace General_configs
{
    class Configs
    {
        public static void ConfigMenu()
        {
            Console.WriteLine("Inicio das configurações!");
        }

        public static void ConfigPlantio()
        {
            //colocar aqui um tipo de temperatura que aparecerá no cadastro do produto.
             int typeTemp = DBConfig.ConsultaTipoTemperatura(); 
        }
    }
}