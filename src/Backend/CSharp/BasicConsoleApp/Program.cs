using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace BasicConsoleApp
{
    public class Program
    {
        static void Main(string[] args)
        {

            var text = "Lorem ipsum +48 666 666 666, dolor sit amet";
            string replacement = "X";
            int lastDigits = 3;

            var anonymizedText = "";

            var phoneNumbers = Regex.Matches(text, @"[+]*[0-9]{1,4}[\s0-9]*");

            foreach (Match phoneNumber in phoneNumbers)
            {
                var phoneChars = phoneNumber.Value.ToCharArray().Reverse().ToArray();
                for (var i = 0; i < lastDigits; i++)
                {
                    phoneChars[i] = replacement.ToCharArray()[0];
                }

                var anonymizedPhone = phoneChars.Reverse();

                //text = text.Remove(phoneNumber.Index, phoneNumber.Length).Insert(phoneNumber.Index, anonymizedPhone);

            }

       

            var result = anonymizedText.Trim();
        }

       
        
    }
}
