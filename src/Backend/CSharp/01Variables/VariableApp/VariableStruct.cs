using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VariableApp
{
    public struct VariableStruct
    {
        public int MyIntegerProperty { get; set; }
        public string MyStringProperty { get; set; }

        public string MyStringMethod()
        { 
            return $" {MyIntegerProperty} - {MyStringProperty} ";
        }
    }
}
