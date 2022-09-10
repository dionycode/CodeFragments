using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VariableApp
{
    public static class FindHighestClass
    {
        public static int FindHighestInteger(int a, int b, int c)
        {
            int highest = a;

            if (highest < b) highest = b;
            else if (highest < c) highest = c;
            
            return highest;
        }

       
    }
}
