using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DateAndTimeApp.Test
{
    public class DateClassTest
    {
        [Fact]
        public void ConvertDaysToYearWeekDays_Test_Valid()
        {
            // Arrange
            var totalDays = 1329;
            var expectedYears = 3;
            var expectedWeeks = 33;
            var expectedDays = 3;

            // Act
            var result = DateClass.ConvertDaysToYearWeekDays(totalDays);

            // Assert
            Assert.Equal(expectedYears, result.years);
            Assert.Equal(expectedWeeks, result.weeks);
            Assert.Equal(expectedDays, result.days);

        }
    }
}
