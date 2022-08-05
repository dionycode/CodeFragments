
using System;

namespace TestConsoleApp1
{
    public class QuadraticEquation
    {
        public static Tuple<double, double> FindRoots(double a, double b, double c)
        {
            var x1 = ((-1 * b) + Math.Sqrt((b * b) - (4 * a * c))) / (2 * a);
            var x2 = ((-1 * b) - Math.Sqrt((b * b) - (4 * a * c))) / (2 * a);

            return Tuple.Create(x1, x2);
        }

        public static void Main(string[] args)
        {
            Tuple<double, double> roots = QuadraticEquation.FindRoots(2, 10, 8);
            Console.WriteLine("Roots: " + roots.Item1 + ", " + roots.Item2);
        }
    }

}
