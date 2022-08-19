using System;

namespace PeopleClassLibrary
{
    public class Person
    {

        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string FullName 
        {
            get
            {
                string fullName = LastName;
                if (!string.IsNullOrEmpty(FirstName) & !string.IsNullOrEmpty(LastName))
                {
                    fullName += ", ";
                }
                fullName += FirstName;
                return fullName;
            }                
        }

    }
}
