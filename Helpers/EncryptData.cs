using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;


namespace AuthenticationProject.Helpers
{
    public static class EncryptData
    {

        public static string EncryptAes(string textToEncrypt, string key)
        {
            //revisa el texto para encriptar
            if (textToEncrypt == null || textToEncrypt.Length <= 0)
            {
                throw new ArgumentNullException(nameof(textToEncrypt));
            }
            //Revisa la llave de encripcion
            if (key == null || key.Length <= 0)
            {
                throw new ArgumentNullException(nameof(key));
            }

            byte[] encriptado;

            //Encripta
            try
            {
                //Arreglos de bytes
                byte[] textoEncriptaBytes = Encoding.UTF8.GetBytes(textToEncrypt);


                //convierte la llave en un arreglo de bytes
                byte[] llave;
                UTF8Encoding encoding = new UTF8Encoding();
                //System.Text.ASCIIEncoding encoding = new ASCIIEncoding();
                llave = encoding.GetBytes(key);

                using (RijndaelManaged aes = new RijndaelManaged())
                {
                    aes.Mode = CipherMode.ECB;
                    aes.Padding = PaddingMode.PKCS7;
                    aes.BlockSize = 128;
                    aes.KeySize = 128;

                    //crea el decriptor
                    ICryptoTransform encryptor = aes.CreateEncryptor(llave, llave);

                    //se crean los streams usados en la encripcion
                    MemoryStream ms = new MemoryStream();
                    CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write);
                    cs.Write(textoEncriptaBytes, 0, textoEncriptaBytes.Length);
                    cs.FlushFinalBlock();

                    encriptado = ms.ToArray();

                    ms.Close();
                    cs.Close();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al encriptar. Mensaje: " + ex.Message + " Source: " + ex.Source);
            }
            finally
            {
            }
            string textoEncriptado = Convert.ToBase64String(encriptado);
            return textoEncriptado;
        }


        public static string DecryptAes(string textToDecrypt, string key)
        {
            //revisa el texto para encriptar
            if (textToDecrypt == null || textToDecrypt.Length <= 0)
            {
                throw new ArgumentNullException(nameof(textToDecrypt));
            }
            //Revisa la llave de encripcion
            if (key == null || key.Length <= 0)
            {
                throw new ArgumentNullException(nameof(key));
            }
            textToDecrypt = textToDecrypt.Replace('_', (char)StringComparison.InvariantCulture);
            textToDecrypt = textToDecrypt.Replace('+', (char)StringComparison.InvariantCulture);

            string textoDesencriptado = "";

            //Desencripta
            try
            {
                //declara los arreglos de bytes
                byte[] encriptadoBytes = Convert.FromBase64String(textToDecrypt);

                //convierte la llave en un arreglo de bytes
                byte[] llave;
                UTF8Encoding encoding = new UTF8Encoding();
                //ASCIIEncoding encoding = new ASCIIEncoding();                
                llave = encoding.GetBytes(key);

                using (RijndaelManaged aes = new RijndaelManaged())
                {
                    aes.Mode = CipherMode.ECB;
                    aes.Padding = PaddingMode.PKCS7;
                    aes.KeySize = 128;
                    aes.BlockSize = 128;

                    //crea el decriptor
                    ICryptoTransform decryptor = aes.CreateDecryptor(llave, llave);

                    //se crean los streams usados en la encripcion
                    MemoryStream ms = new MemoryStream(encriptadoBytes);
                    CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read);

                    byte[] desencriptadoBytes = new byte[encriptadoBytes.Length];

                    int cantidadDesencriptado = cs.Read(desencriptadoBytes, 0, desencriptadoBytes.Length);

                    //cierra los stremas
                    ms.Close();
                    cs.Close();

                    //throw new Exception(desencriptadoBytes.ToString() + "|" + cantidadDesencriptado);
                    textoDesencriptado = Encoding.UTF8.GetString(desencriptadoBytes, 0, cantidadDesencriptado);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al desencriptar. Mensaje: " + ex.Message + " Source: " + ex.Source);
            }
            finally
            {
            }
            if (!string.IsNullOrEmpty(textoDesencriptado.Trim()))
            {
                return textoDesencriptado;
            }
            else
            {
                return "";
            }
        }
    }
}