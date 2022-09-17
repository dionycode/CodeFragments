using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccessModifiersClassLibrary
{
    public class SameProjectClass
    {
        private void MySameProjectDemoCaller()
        {
            var myObjectClass = new MyObjectClass();

            myObjectClass.MyInternalMethod();
            myObjectClass.MyProtectedInternalMethod();
            myObjectClass.MyPublicMethod();
        }
    }

    public class SameProjectInheritanceClass : MyObjectClass
    {
        private void MySameProjectDemoCaller()
        {
            MyProtectedMethod();
            MyPrivateProtectedMethod();

            MyInternalMethod();
            MyProtectedInternalMethod();
            MyPublicMethod();
        }
    }
}
