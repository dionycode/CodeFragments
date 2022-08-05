using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestConsoleApp1
{
    public class MergeNames
    {
        public static string[] UniqueNames(string[] names1, string[] names2)
        {
            string[] allNames = names1.Concat(names2).ToArray();
            List<string> names = new List<string>();
            foreach (string name in allNames)
            {
                if (!names.Contains(name))
                {
                    names.Add(name);
                }
            }

            return names.ToArray();
        }

        //public static void Main(string[] args)
        //{
        //    string[] names1 = new string[] { "Ava", "Emma", "Olivia" };
        //    string[] names2 = new string[] { "Olivia", "Sophia", "Emma" };
        //    Console.WriteLine(string.Join(", ", MergeNames.UniqueNames(names1, names2))); // should print Ava, Emma, Olivia, Sophia
        //}
    }
}
