using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DateAndTimeApp
{
    public static class DateClass
    {
        public static (int years, int weeks, int days) ConvertDaysToYearWeekDays(int days)
        {
            int _year = days / 365;
            days = days % 365;

            int _weeks = days / 7;
            days = days % 7;

            return (_year, _weeks, days);
        }
    }
}
