using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TestConsoleApp1
{

    // Testing class inheritance
    public class Team
    {

        public Team(string argTeamName, int argNoOfPlayers)
        {
            teamName = argTeamName;
            noOfPlayers = argNoOfPlayers;
        }

        public string teamName { get; set; }
        public int noOfPlayers { get; set; }

        public void AddPlayer(int count)
        {
            noOfPlayers += count;
        }

        public bool RemovePlayer(int count)
        {
            if (noOfPlayers - count < 0)
            {
                return false;
            }

            noOfPlayers += count;
            return true;
        }
    }

    public class Subteam : Team
    {
        public Subteam(string argTeamName, int argNoOfPlayers) : base(argTeamName, argNoOfPlayers)
        {

        }
        //public SubTeam(string argTeamName, int argNoOfPlayers) : base(argTeamName, argNoOfPlayers)
        //{
        //}

        public void ChangeTeamName(string name)
        {
            teamName = name;
        }

    }

    // Testing LINQ Group By

    public class Employee
    {
        public string? Company { get; set; }
        public int Age { get; set; }
    }

    public class EmployeeClass
    {
        public static Dictionary<string, int> AverageAgeForEachCompany(List<Employee> employees)
        {
            var results = (from employee in employees
                           group employee by employee.Company into gemployee
                           select new { Company = gemployee.Key, AverageAge = gemployee.Average(o => o.Age) }).ToList();

            var dictResult = new Dictionary<string, int>();
            foreach (var result in results)
            {
                dictResult.Add(result.Company, (int)result.AverageAge);
            }

            return dictResult;
        }

        public static Dictionary<string, int> CountOfEmployeesForEachCompany(List<Employee> employees)
        {
            var results = (from employee in employees
                           group employee by employee.Company into gemployee
                           select new { Company = gemployee.Key, Count = gemployee.Count() }).ToList();

            var dictResult = new Dictionary<string, int>();
            foreach (var result in results)
            {
                dictResult.Add(result.Company, result.Count);
            }

            return dictResult;
        }

        public static Dictionary<string, Employee> OldestAgeForEachCompany(List<Employee> employees)
        {
            var results = (from employee in employees
                           group employee by employee.Company into gemployee
                           select new { Company = gemployee.Key, OldersEmployee = gemployee.First(o => o.Age == gemployee.Max(o => o.Age)) }).ToList();

            var dictResult = new Dictionary<string, Employee>();
            foreach (var result in results)
            {
                dictResult.Add(result.Company, result.OldersEmployee);
            }

            return dictResult;
        }


    }
}
