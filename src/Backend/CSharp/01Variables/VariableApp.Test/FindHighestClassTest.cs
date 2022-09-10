using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VariableApp.Test
{
    public class FindHighestClassTest
    {
        [Fact]
        public void FindHighestInteger_Test_Valid()
        {
            // Arrange
            var expected = 9;

            // Act
            var result = FindHighestClass.FindHighestInteger(1, 9, 5);

            // Assert
            Assert.Equal(expected, result);

        }


    }
}
