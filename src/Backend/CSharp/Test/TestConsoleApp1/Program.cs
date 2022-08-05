
using System;

namespace TestConsoleApp1
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            Tuple<double, double> roots = QuadraticEquation.FindRoots(2, 10, 8);
            Console.WriteLine("Roots: " + roots.Item1 + ", " + roots.Item2);
        }
    }
}
