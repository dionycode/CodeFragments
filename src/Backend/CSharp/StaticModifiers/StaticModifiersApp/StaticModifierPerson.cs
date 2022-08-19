using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StaticModifiersApp
{
    public class StaticModifierPerson
    {
        public string Name { get; set; }

        public static int InstanceCount { get; set; }
    }
}
