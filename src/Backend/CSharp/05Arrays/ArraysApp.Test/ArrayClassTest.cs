namespace ArraysApp.Test
{
    public class ArrayClassTest
    {
        [Fact]
        public void IntegerArraySum_Test_Valid()
        {
            // Arrange
            var arrayClass = new ArrayClass();
            var integerArray = new List<int>
            {
                1, 2, 3, 4, 5
            };


            // Act
            var expectedResult = 15;
            var actualResult = arrayClass.IntegerArraySum(integerArray);

            // Assert
            Assert.Equal(expectedResult, actualResult);
        }

        [Fact]
        public void GetMatrixDiagonals_Test_Valid()
        {
            // Arrange
            var arrayClass = new ArrayClass();
            var mattrix = new List<List<int>>
            {
                new List<int> { 1, 2, 3},
                new List<int> { 4, 5, 6},
                new List<int> { 7, 8, 9},
            };

            // Act
            var expectedLeftDiagonalResult = new List<int> { 1, 5, 9 };
            var expectedRightDiagonalResult = new List<int> { 3, 5, 7 };

            var result = arrayClass.GetMatrixDiagonals(mattrix);

            var actualLeftDiagonalResult = result.leftDiagonalArray;
            var actualRightDiagonalResult = result.rightDiagonalArray;
                      

            // Assert
            Assert.Equal(expectedLeftDiagonalResult[0], actualLeftDiagonalResult[0]);
            Assert.Equal(expectedLeftDiagonalResult[1], actualLeftDiagonalResult[1]);
            Assert.Equal(expectedLeftDiagonalResult[2], actualLeftDiagonalResult[2]);

            Assert.Equal(expectedRightDiagonalResult[0], actualRightDiagonalResult[0]);
            Assert.Equal(expectedRightDiagonalResult[1], actualRightDiagonalResult[1]);
            Assert.Equal(expectedRightDiagonalResult[2], actualRightDiagonalResult[2]);

        }

        [Fact]
        public void TestPrecision()
        {
            var arr = new List<int> { 1, 2 , 0, -3, -4 };

            var _positiveCount = 0;
            var _negativeCount = 0;
            var _zeroCount = 0;
            for (var i = 0; i < arr.Count; i++)
            {
                _positiveCount = arr[i] > 0 ? ++_positiveCount : _positiveCount;
                _negativeCount = arr[i] < 0 ? ++_negativeCount : _negativeCount;
                _zeroCount = arr[i] == 0 ? ++_zeroCount : _zeroCount;
            }

            var positivePortion = Math.Round(((decimal)_positiveCount/arr.Count), 6);
            var negativePortion = Math.Round(((decimal)_negativeCount /arr.Count), 6);
            var zeroPertion = Math.Round(((decimal)_zeroCount /arr.Count), 6);

            Assert.Equal("0.400000", positivePortion.ToString("N6"));
            Assert.Equal("0.400000", negativePortion.ToString("N6"));
            Assert.Equal("0.200000", zeroPertion.ToString("N6"));
        }

        [Fact]
        public void ArrayMinMax_Test_Solution1()
        {
            // Arrange
            var randomArray = new List<int> { 1, 8, 2, 6, 4 };
            var expectedMinimumSum = 13;
            var expectedMaximumSum = 20;

            // Act
            var sortedArray = randomArray.OrderBy(x => x).ToList();
            var actualMinimumSum = sortedArray.Take(sortedArray.Count - 1).Sum();
            var actualMaximumSum = sortedArray.Skip(1).Sum();

            // Assert
            Assert.Equal(expectedMinimumSum, actualMinimumSum);
            Assert.Equal(expectedMaximumSum, actualMaximumSum);
        }

        [Fact]
        public void ArrayMinMax_Test_Solution2()
        {
            // Arrange
            var arrayClass = new ArrayClass();
            var randomArray = new List<int> { 1, 8, 2, 6, 4 };
            var expectedMinimumSum = 13;
            var expectedMaximumSum = 20;

            // Act            
            var result = arrayClass.GetArrayMinSumMaxSum(randomArray);


            // Assert
            Assert.Equal(expectedMinimumSum, result.minSum);
            Assert.Equal(expectedMaximumSum, result.maxSum);
        }

        [Fact]
        public void ArrayHighestDistribution_Test_Solution1()
        {
            // Arrange
            var arrayClass = new ArrayClass();
            var randomArray = new List<int> { 1, 8, 2, 6, 4, 8 };
            var expectedHighestNumber = 8;
            var expectedDistributionCount = 2;

            // Act            
            var result = arrayClass.GetHighestNumberDistribution(randomArray);

            // Assert
            Assert.Equal(expectedHighestNumber, result.highestNumber);
            Assert.Equal(expectedDistributionCount, result.distributionCount);
        }
    }
}