using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DelegateClassLibrary
{
    public class DelegateCallbackFunctionClass
    {
        public delegate void DelegateCallback(int progress);

        public void LongRunningProcess(DelegateCallback callback)
        {
            for (var i = 0; i < 100; i++)
            { 
                callback(i);
            }
        }
    }
}
