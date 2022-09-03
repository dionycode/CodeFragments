using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArraysApp
{
    public class ArrayClass
    {
        public int IntegerArraySum(List<int> integerArray)
        {
            var arraySum = 0;
            for (var i = 0; i < integerArray.Count; i++)
            {
                arraySum += integerArray[i];
            }

            return arraySum;
        }

        public (List<int> leftDiagonalArray, List<int> rightDiagonalArray) GetMatrixDiagonals(List<List<int>> integerMatrix)
        {
            var _leftDiagonalArray = new List<int>();
            var _rightDiagonalArray = new List<int>();

            for (var i = 0; i < integerMatrix.Count; i++)
            {
                var leftIndex = i;
                var rightIndex = integerMatrix.Count - i - 1;

                _leftDiagonalArray.Add(integerMatrix[i][leftIndex]);
                _rightDiagonalArray.Add(integerMatrix[i][rightIndex]);
            }

            return (_leftDiagonalArray, _rightDiagonalArray);
        }

        public (int minSum, int maxSum) GetArrayMinSumMaxSum(List<int> integerArray)
        {
            int _highestNumber = integerArray[0];
            int _lowestNumber = integerArray[0];
            int _currentSum = integerArray[0];
            for (var i = 1; i < integerArray.Count; i++)
            {
                if (integerArray[i] < _lowestNumber)
                {
                    _lowestNumber = integerArray[i];
                }

                if (integerArray[i] > _highestNumber)
                {
                    _highestNumber = integerArray[i];
                }

                _currentSum += integerArray[i];
            }

            int minimumSum = _currentSum - _highestNumber;
            int maximumSum = _currentSum - _lowestNumber;

            return (minimumSum, maximumSum);
        }

        public (int highestNumber, int distributionCount) GetHighestNumberDistribution(List<int> integerArray)
        {
            int _highestNumber = integerArray[0];
            int _distributionCount = 1;
            for (var i = 1; i < integerArray.Count; i++)
            {

                if (integerArray[i] > _highestNumber)
                {
                    _highestNumber = integerArray[i];
                    _distributionCount = 1;
                }
                else if (integerArray[i] == _highestNumber)
                {
                    _distributionCount++;
                }
            }

            return (_highestNumber, _distributionCount);
        }
    }
}
