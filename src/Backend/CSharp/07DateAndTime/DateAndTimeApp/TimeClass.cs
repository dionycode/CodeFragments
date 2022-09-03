using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DateAndTimeApp
{
    public class TimeClass
    {
        public string ConvertTo24HourFormat(string time12HourFormat)
        {
            var timeStrings = time12HourFormat.Split(':');
            var minuteChars = timeStrings[2].ToCharArray();
            var currentHour = int.Parse(timeStrings[0]);
            string time24HourFormat = "";
            if (minuteChars[2] == 'P')
            {
                if (currentHour < 12)
                {
                    currentHour += 12;
                }

            }
            if (minuteChars[2] == 'A')
            {
                if (currentHour == 12)
                {
                    currentHour = 0;
                }
            }

            time24HourFormat += currentHour.ToString("00");
            time24HourFormat += time12HourFormat.Substring(2, 6);

            return time24HourFormat;
        }
    }
}
