namespace AccessModifiersClassLibrary
{
    public class MyObjectClass
    {
        private void MyPrivateMethod()
        { 
        
        }

        protected void MyProtectedMethod()
        { 
        
        }

        private protected void MyPrivateProtectedMethod()
        { 
        
        }

        internal void MyInternalMethod()
        { 
        
        }

        protected internal void MyProtectedInternalMethod()
        { 
        
        }

        public void MyPublicMethod()
        { 
        
        }


        private void MyObjectClassDemoCaller()
        {
            MyPrivateMethod();
            MyProtectedMethod();
            MyPrivateProtectedMethod();
            MyInternalMethod();
            MyProtectedInternalMethod();
            MyPublicMethod();
        }
    }
}