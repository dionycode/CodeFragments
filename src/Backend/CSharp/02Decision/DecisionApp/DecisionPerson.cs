using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DecisionApp
{    
    public class ElectionValidator
    {
        public (bool success, string message) CanPersonVoteIfElse(int age)
        {
            const int _legalAge = 18;

            if (age >= _legalAge)
            {
                return (true, "The person can vote");
            }
            else
            {
                return (false, "Sorry, you cannot vote");
            }
        }

        public (bool success, string message) CanPersonVoteSwitchCase(int age)
        {
            const int _legalAge = 18;

            switch (age)
            { 
                case > _legalAge:
                    return (true, "The person can vote");
                default:
                    return (false, "Sorry, you cannot vote");

            }
            
        }

        public (bool success, string message) CanPersonVoteTernary(int age)
        {
            const int _legalAge = 18;

            return age >= _legalAge ? (true, "The person can vote") : (false, "Sorry, you cannot vote");
        }
    }
}
