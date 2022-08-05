using System;
using System.Collections.Generic;

namespace OOPConsole31
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Encapsulation
            var person1 = new Person();
            person1.Name = "Joe";
            person1.BirthDate = Convert.ToDateTime("1990/01/01 01:00:00");

            Console.WriteLine(person1.Name);
            Console.WriteLine(person1.BirthDate);
        }
    }

    // Encapsulation - Hide the data
    // _name and _birthDate are encapsulated
    public class Person 
    {
        // Private Variables
        private string _name;
        private DateTime _birthDate;

        // Public accessors
        public string Name
        { 
            get { return _name; }
            set { _name = value; }
        }

        // Public accessors
        public DateTime BirthDate
        { 
            get { return _birthDate; }
            set { _birthDate = value; }
        }
        
    }


    // Abstraction -Show only what is necessary (Hide the complexity)
    // Show only the Register()
    public class GuestBook
    {
        private List<Person> _guests;

        public GuestBook()
        {
            _guests = new List<Person>();
        }

        public bool Register()
        {
            // Validate
            Validate();

            // Establish DB Connection

            ConnectToDb();

            // Save to Database
            SaveToDb();

            return true;
        }


        private bool Validate()
        {
            return true;
        }

        private string ConnectToDb()
        {
            return "Db Connection";
        }

        private bool SaveToDb()
        {
            // Im saving to DB
            return true;
        }


    }


    // Inheritance
    public class Employee : Person
    { 
        public int EmployeeId { get; set; }

        public virtual string Communicate()
        {
            return "I am an employee";
        }
    }

    // Polymorphism
    public class Programmer : Employee
    {
        public override string Communicate()
        {
            return "I am a programmer!";
        }
    }

    public class Accountant : Employee
    {
        public override string Communicate()
        {
            return "I am an accountant|";
        }
    }

    public class Personel : Employee
    {
        
    }


}
