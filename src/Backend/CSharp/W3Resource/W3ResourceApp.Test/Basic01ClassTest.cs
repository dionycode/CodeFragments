namespace W3ResourceApp.Test
{
    public class Basic01ClassTest
    {
        [Theory]
        [InlineData(350, 5, 70.00)]
        [InlineData(500, 10, 50.00)]
        [InlineData(500, 3, 166.67)]
        public void Exercise14_ComputeAverage_Test(int distanceInKilometer, int fuelInLiters, decimal expectedOutput)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise14_ComputeAverage(distanceInKilometer, fuelInLiters);

            // Assert
            Assert.Equal(expectedOutput, result);
        }

        [Theory]
        [InlineData(25, 15, 35, 10, 11.1803)]
        [InlineData(1, 1, 3, 3, 2.8284)]
        [InlineData(2, 3, 5, 6, 4.2426)]
        [InlineData(-2, 3, 5, -6, 11.4018)]
        public void Exercise15_ComputeCoordinateDistance_Test(int x1, int y1, int x2, int y2, double expectedOutput)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise15_ComputeCoordinateDistance(x1, y1, x2, y2);

            // Assert
            Assert.Equal(expectedOutput, result);
        }

        [Theory]
        [InlineData(375, 3, 1, 1, 0, 1, 0, 0)]
        [InlineData(3, 0, 0, 0, 0, 0, 1, 1)]
        [InlineData(200, 2, 0, 0, 0, 0, 0, 0)]
        public void Exercise16_BreakDownToBankNotes_Test(
            int amount,
            int expectedHundreds,
            int expectedFifties,
            int expectedTwenties,
            int expectedTens,
            int expectedFives,
            int expectedTwos,
            int expectedOnes)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise16_BreakDownToBankNotes(amount);

            // Assert
            Assert.Equal(expectedHundreds, result.hundreds);
            Assert.Equal(expectedFifties, result.fifties);
            Assert.Equal(expectedTwenties, result.twenties);
            Assert.Equal(expectedTens, result.tens);
            Assert.Equal(expectedFives, result.fives);
            Assert.Equal(expectedTwos, result.twos);
            Assert.Equal(expectedOnes, result.ones);
        }

        [Theory]
        [InlineData(25300, 7, 1, 40)]
        public void Exercise17_ConvertToHourMinutesSeconds_Test(int seconds, int expectedHours, int expectedMinutes, int expectedSeconds)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise17_ConvertToHourMinutesSeconds(seconds);

            // Assert
            Assert.Equal(expectedHours, result.hours);
            Assert.Equal(expectedMinutes, result.minutes);
            Assert.Equal(expectedSeconds, result.seconds);
        }

        [Theory]
        [InlineData(2535, 6, 11, 15)]
        public void Exercise18_ConvertToYearMonthDays_Test(int days, int expectedYears, int expectedMonths, int expectedDays)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise18_ConvertToYearMonthDays(days);

            // Assert
            Assert.Equal(expectedYears, result.years);
            Assert.Equal(expectedMonths, result.months);
            Assert.Equal(expectedDays, result.days);
        }

        [Theory]
        [InlineData(2, 35, 15, 46, "Correct values")]
        [InlineData(2, -35, 15, 46, "Wrong values")]
        [InlineData(1, 35, 15, 46, "Wrong values")]
        [InlineData(50, 35, 15, 46, "Wrong values")]
        public void Exercise19_IntegerMultipleConditions(int p, int q, int r, int s, string expectedOutput)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise19_IntegerMultipleConditions(p, q, r, s);

            // Assert
            Assert.Equal(expectedOutput, result);
        }

        [Theory]
        [InlineData(25, 35, 12, true, -0.6, -0.8)]              // discriminant > 0
        [InlineData(1, 4, -12, true, 2, -6)]                    // discriminant > 0
        [InlineData(1, 4, 4, true, -2, -2)]                     // discriminant = 0, same root
        [InlineData(1, 2, 4, false, double.NaN, double.NaN)]    // discriminant < 0, invalid
        public void Exercise20_FindRoots_Test(double a, double b, double c, bool expectedIsValid, double expectedRoot1, double expectedRoot2)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise20_FindRoots(a, b, c);

            // Assert
            Assert.Equal(expectedIsValid, result.isValid);
            Assert.Equal(expectedRoot1, result.root1);
            Assert.Equal(expectedRoot2, result.root2);
        }

        [Theory]
        [InlineData(-1, false, 0, 0)]
        [InlineData(85, false, 0, 0)]
        [InlineData(1, true, 0, 20)]
        [InlineData(23, true, 21, 40)]
        public void Exercise21_FindRange_Test(int number, bool expectedIsValid, int expectedLowerLimit, int expectedHigherLimit)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise21_FindRange(number);

            // Assert
            Assert.Equal(expectedIsValid, result.isValid);
            Assert.Equal(expectedLowerLimit, result.lowerLimit);
            Assert.Equal(expectedHigherLimit, result.higherLimit);
        }

        [Theory]
        [InlineData(new int[] {11, 17, 13, 12, 5}, 46)]
        [InlineData(new int[] {0, 2, 14, 12, 8}, 0)]
        public void Exercise22_ComputeOddNumberSum_Test(int[] numbers, int expectedSum)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise22_ComputeOddNumberSum(numbers);

            // Assert
            Assert.Equal(expectedSum, result);
        }

        [Theory]
        [InlineData(25, 15, 35, true, 75)]
        [InlineData(15, 35, 25, true, 75)]
        [InlineData(35, 25, 15, true, 75)]
        [InlineData(8, 2, 5, false, 0)]
        public void Exercise23_ComputeTrianglePerimeter(double a, double b, double c, bool expectedIsValid, double expectedPerimeter)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise23_ComputeTrianglePerimeter(a, b, c);

            // Assert
            Assert.Equal(expectedIsValid, result.isValid);
            Assert.Equal(expectedPerimeter, result.perimeter);
        }

        [Theory]
        [InlineData(15, 5, true)]
        [InlineData(3, 15, true)]
        [InlineData(16, 16, true)]
        [InlineData(6, 16, false)]
        [InlineData(11, 10, false)]
        public void Exercise24_IsMultiplied_Test(int a, int b, bool expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise24_IsMultiplied(a, b);

            // Assert
            Assert.Equal(expectedResult, result);
        }

        [Theory]
        [InlineData(0, null)]
        [InlineData(3, "March")]
        [InlineData(8, "August")]
        [InlineData(16, null)]
        public void Exercise25_ConvertToMonthString_Test(int month, string expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise25_ConvertToMonthString(month);

            // Assert
            Assert.Equal(expectedResult, result);
        }

        [Theory]
        [InlineData(1, 10, new int[] { 2, 4, 6, 8, 10 })]
        [InlineData(11, 20, new int[] { 12, 14, 16, 18, 20 })]
        [InlineData(21, 30, new int[] { 22, 24, 26, 28, 30 })]
        public void Exercise26_GetEvenNumbers_Test(int lowerLimit, int upperLimit, int[] expectedEvenNumbers)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise26_GetEvenNumbers(lowerLimit, upperLimit);

            // Assert
            Assert.Equal(expectedEvenNumbers.Length, result.Length);
            for (var i = 0; i < expectedEvenNumbers.Length; i++)
            {
                Assert.Equal(expectedEvenNumbers[i], result[i]);
            }            
        }

        [Theory]
        [InlineData(new int[] { 2, 0, 1, 8, 10 }, 0, 5)]
        [InlineData(new int[] { -2, -4, -6, -8, -10 }, 5, 0)]
        [InlineData(new int[] { -2, -4, -6, 8, 10 }, 3, 2)]
        public void Exercise27_CountNegativePositiveNumbers_Test(int[] numbers, int expectedNegativeCount, int expectedPositiveCount)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise27_CountNegativePositiveNumbers(numbers);

            // Assert
            Assert.Equal(expectedNegativeCount, result.negativeCount);
            Assert.Equal(expectedPositiveCount, result.positiveCount);
           
        }

        [Theory]
        [InlineData(new int[] { 5, 8, 10, -5, 25 }, 4, 12.00)]
        [InlineData(new int[] { 2, 0, 1, 8, 10 }, 5, 4.20)]
        [InlineData(new int[] { -2, -4, -6, -8, -10 }, 0, double.NaN)]
        [InlineData(new int[] { -2, -4, -6, 8, 10 }, 2, 9.00)]
        public void Exercise28_GetPositiveCountAndAverage_Test(int[] numbers, int expectedPositiveCount, double expectedPositiveAverage)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise28_GetPositiveCountAndAverage(numbers);

            // Assert
            Assert.Equal(expectedPositiveCount, result.positiveCount);
            Assert.Equal(expectedPositiveAverage, result.positiveAverage);

        }

        [Theory]
        [InlineData(new int[] { 5, 7, 9, 10, 13 }, 34)]
        public void Exercise29_ComputeOddNumberSum_Test(int[] numbers, int expectedSum)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise29_SumOddNumbers(numbers);

            // Assert
            Assert.Equal(expectedSum, result);
        }


        [Theory]
        [InlineData(10, new int[] { 4, 16, 36, 64, 100 })]
        public void Exercise30_SquareEvenNumbers_Test(int number, int[] expectedSquaredEvenNumbers)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise30_SquareEvenNumbers(number);

            // Assert
            Assert.Equal(expectedSquaredEvenNumbers.Length, result.Length);
            for (var i = 0; i < expectedSquaredEvenNumbers.Length; i++)
            {
                Assert.Equal(expectedSquaredEvenNumbers[i], result[i]);
            }
        }


        [Theory]
        [InlineData(10, "Positive Even")]
        [InlineData(11, "Positive Odd")]
        [InlineData(-10, "Negative Even")]
        [InlineData(-11, "Negative Odd")]
        public void Exercise31_CheckInteger_Test(int number, string expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise31_CheckInteger(number);

            // Assert
            Assert.Equal(expectedResult, result);           
        }

        [Theory]
        [InlineData(25, new int[] { 3, 28, 53, 78 })]
        [InlineData(10, new int[] { 3, 13, 23, 33, 43, 53, 63, 73, 83, 93 })]
        public void Exercise32_CheckNumberWithRemainder3_Test(int number, int[] expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise32_CheckNumberWithRemainder3(number);

            // Assert
            Assert.Equal(expectedResult.Length, result.Length);
            for (var i = 0; i < expectedResult.Length; i++)
            {
                Assert.Equal(expectedResult[i], result[i]);
            }
        }

        [Theory]
        [InlineData(new int[] { 5, 7, 15, 23, 45 }, 45, 5)]
        [InlineData(new int[] { 5, 7, 9, 10, 3 }, 10, 4)]
        public void Exercise33_FindHighestNumberPosition_Test(int[] numbers, int expectedHighest, int expectedPostition)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise33_FindHighestNumberPosition(numbers);

            // Assert
            Assert.Equal(expectedHighest, result.highestNumber);
            Assert.Equal(expectedPostition, result.position);
        }

        [Theory]
        [InlineData(10, 2, new int[] { 3, 5, 7 , 9}, 24)]
        [InlineData(2, 10, new int[] { 3, 5, 7 , 9}, 24)]
        public void Exercise34_SumOddNumbers_Test(int firstNumber, int secondNumber, int[] expectedOddNumbers, int expectedSum)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise34_SumOddNumbers(firstNumber, secondNumber);

            // Assert
            Assert.Equal(expectedOddNumbers, result.oddNumbers);
            Assert.Equal(expectedSum, result.sumOfOddNumbers);
        }

        [Theory]
        [InlineData(1, 2, "The pair is in ascending order")]
        [InlineData(5, 2, "The pair is in descending order")]
        public void Exercise35_CheckIntergerOrder_Test(int number1, int number2, string expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise35_CheckIntergerOrder(number1, number2);

            // Assert
            Assert.Equal(expectedResult, result);

        }

        [Theory]
        [InlineData("1234", "Correct password")]
        [InlineData("1324", "Incorrect password")]
        public void Exercise36_CheckPassword_Test(string password, string expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise36_CheckPassword(password);

            // Assert
            Assert.Equal(expectedResult, result);

        }

        [Theory]
        [InlineData(2,3, "Quadrant-I (+,+)")]
        [InlineData(-4,5, "Quadrant-II (-,+)")]
        [InlineData(-6,-7, "Quadrant-III (-,-)")]
        [InlineData(8,-9, "Quadrant-IV (+,-)")]
        public void Exercise37_FindQuadrant_Test(int x, int y, string expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise37_FindQuadrant(x, y);

            // Assert
            Assert.Equal(expectedResult, result);

        }


        [Theory]
        [InlineData(2, 0, null, "Division not possible")]
        [InlineData(8, 4, 2.0, "Success")]
        public void Exercise38_Division_Test(int number1, int number2, double? expectedResult, string expectedResultMessage)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise38_Division(number1, number2);

            // Assert
            Assert.Equal(expectedResult, result.result);
            Assert.Equal(expectedResultMessage, result.message);

        }

        [Theory]
        [InlineData(50, 99, 3521)]
        public void Exercise39_SumOfNumbersNotDivisibleBy17_Test(int number1, int number2, int expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise39_SumOfNumbersNotDivisibleBy17(number1, number2);

            // Assert
            Assert.Equal(expectedResult, result);

        }

        [Theory]
        [InlineData(25, 45, new int[] { 30, 31, 37, 38, 44 })]
        public void Exercise40_NumbersDividedBy7_Test(int number1, int number2, int[] expectedResult)
        {
            // Arrange

            // Act
            var result = Basic01Class.Exercise40_NumbersDividedBy7(number1, number2);

            // Assert
            Assert.Equal(expectedResult.Length, result.Length);
            for (var i = 0; i < expectedResult.Length; i++)
            {
                Assert.Equal(expectedResult[i], result[i]);
            }
        }

        [Fact]
        public void Exercise41_Create3ColumnMatrix_Test()
        {
            // Arrange
            var lines = 3;
            var expectedResult = new int[,] { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };

            // Act
            var result = Basic01Class.Exercise41_Create3ColumnMatrix(lines);

            // Assert
            Assert.Equal(expectedResult.Length, result.Length);
            for (var i = 0; i < 3; i++)
            {
                for (var j = 0; j < 3; j++)
                {
                    Assert.Equal(expectedResult[i,j], result[i,j]);
                }
                
            }
        }


        [Fact]
        public void Exercise42_CreateSquareCubeMatrix_Test()
        {
            // Arrange
            var lines = 3;
            var expectedResult = new int[,] { { 1, 1, 1 }, { 2, 4, 8 }, { 3, 9, 27 } };
            // Act
            var result = Basic01Class.Exercise42_CreateSquareCubeMatrix(lines);

            // Assert
            Assert.Equal(expectedResult.Length, result.Length);
            for (var i = 0; i < 3; i++)
            {
                for (var j = 0; j < 3; j++)
                {
                    Assert.Equal(expectedResult[i, j], result[i, j]);
                }

            }
        }

        [Fact]
        public void Exercise43_CreateNumberMatrix_Test()
        {
            // Arrange
            var rows = 3;
            var cols = 3;
            var expectedResult = new int[,] { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };

            // Act
            var result = Basic01Class.Exercise43_CreateNumberMatrix(rows, cols);

            // Assert
            Assert.Equal(expectedResult.Length, result.Length);
            for (var i = 0; i < rows; i++)
            {
                for (var j = 0; j < cols; j++)
                {
                    Assert.Equal(expectedResult[i, j], result[i, j]);
                }

            }
        }


    }
}