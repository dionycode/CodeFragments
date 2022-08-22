using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VariableApp
{
    public class VariableClass
    {
        public int MyIntegerProperty { get; set; }
        public string MyStringProperty { get; set; }

        public string MyStringMethod()
        { 
            return $" {MyIntegerProperty.ToString()} - {MyStringProperty} ";
        }
    }

    public class ChildClass : VariableClass
    { 
        public int ChildIntegerProperty { get; set; }
    }
}
