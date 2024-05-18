using System;
using System.Data.SqlClient;
using User_Assets;
using Client_Config;
using Product_Config;

namespace Database_Config
{
    public class Database
    {
        //terminar no segundo PIM as confiugurações de tipo e conexão no banco.
        public int tipoConexão {  get; private set; }
        public string servidor { get; private set; }

        public static string ConnectionStringWhithDefinedUser = "Server=SEU_SERVIDOR;Database=SEU_BANCO_DE_DADOS;User Id=SEU_USUARIO;Password=SUA_SENHA;";
        public static string ConnectionStringWhithWUser = "Server=DESKTOP-ADLTFRR\\DATABASEXEANSAO;Database=PINDUCAS_farm;Trusted_Connection=True; \r\n";
    }

    public class DBDefaultRequests()
    {
        public static void ExcecuteQuery(string Command)
        {
            using (SqlConnection connection = new SqlConnection(Database.ConnectionStringWhithWUser))
            {
                SqlCommand cmd = new SqlCommand(Command, connection);
                connection.Open();
                cmd.ExecuteNonQuery();
                connection.Close();
            }
        }
    }

    public class DBUsers
    {
        public static void CreateUser(User tmpUser)
        {
                string query = @$"
                insert into Usuarios (nome, username, senha)
                values ('{tmpUser.Nome}', '{tmpUser.Username}', '{tmpUser.Password}');
                ";
                DBDefaultRequests.ExcecuteQuery(query);
        }

        public static List<User> SearchUsers(string username)
        {  
            try
            {
                string query = @$"
                    select * from Usuarios where username like '{username}%'
                ";

                List<User> foundedUsers = new List<User>();

                using (SqlConnection conn = new SqlConnection(Database.ConnectionStringWhithWUser))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            User tmpUser = new User(
                                reader.GetInt32(reader.GetOrdinal("id")),
                                reader.GetString(reader.GetOrdinal("nome")),
                                reader.GetString(reader.GetOrdinal("username")),
                                reader.GetString(reader.GetOrdinal("senha"))
                            );
                            foundedUsers.Add(tmpUser);              
                        }
                    }
                    if (foundedUsers.Count == 0) ;
                    {
                        throw new Exception("Nenhum valor encontrado.");
                    }
                    return foundedUsers;
                }
            }catch (Exception e)
            {
                Console.WriteLine($"Erro (database.cs) : {e}");
                return null;
            }
 
        }
    }

    public class DBConfig
    {
        //modelo

        public static int ConsultaTipoTemperatura()
        {
            //código aqui
            return 0;
        }
    }

    public class DBProduct
    {
        public static void DBInsertProduct(Product p1)
        {
            //ta aqui chefia
        }
    }

    public class DBClient
    {

    }
    public class DBLotes
    {
        public static void DBCreatelote(Lote tmplote)
        {
            //codigo do insert
        }
    }
}
