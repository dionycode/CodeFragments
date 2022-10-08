using AccessModifiersClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessModifiersApp
{
    public class AccessModifiersAppClass
    {
        public void AccessModifiersAppMethod()
        {
            var myObjectClass = new MyObjectClass();

            myObjectClass.MyPublicMethod();
        }
    }

    public class AccessModifiersAppInheritanceClass : MyObjectClass
    {
        public void AccessModifiersAppMethod()
        {
            MyProtectedMethod();
            MyProtectedInternalMethod();
            MyPublicMethod();
        }
    }
}
