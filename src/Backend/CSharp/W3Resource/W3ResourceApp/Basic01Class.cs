using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace W3ResourceApp
{
    public static class Basic01Class
    {
        public static decimal Exercise14_ComputeAverage(int distanceInKilometer, int fuelInLiters)
        { 
            decimal averageConsumption = (decimal)distanceInKilometer / (decimal)fuelInLiters;
            return Math.Round(averageConsumption, 2);
        }

        public static double Exercise15_ComputeCoordinateDistance(int x1, int y1, int x2, int y2)
        { 
            double xLenght = x2 - x1;
            double yHeight = y2 - y1;

            double distance = ComputeTriangleHypotenuse(xLenght, yHeight);

            return Math.Round(distance, 4);
        }

        private static double ComputeTriangleHypotenuse(double length, double height)
        {
            double hypothenuse = Math.Sqrt(Math.Pow(length, 2) + Math.Pow(height, 2));

            return hypothenuse;
        }

        public static (int hundreds, int fifties, int twenties, int tens, int fives, int twos, int ones)
            Exercise16_BreakDownToBankNotes(int amount)
        {            
            var _hundreds = amount / 100;            
            var _fifties = (amount - (_hundreds * 100)) / 50;
            var _twenties= (amount - (_hundreds * 100) - (_fifties * 50)) / 20;
            var _tens= (amount - (_hundreds * 100) - (_fifties * 50) - (_twenties * 20)) / 10;
            var _fives = (amount - (_hundreds * 100) - (_fifties * 50) - (_twenties * 20) - (_tens * 10)) / 5;
            var _twos = (amount - (_hundreds * 100) - (_fifties * 50) - (_twenties * 20) - (_tens * 10) - (_fives * 5)) / 2;
            var _ones = (amount - (_hundreds * 100) - (_fifties * 50) - (_twenties * 20) - (_tens * 10) - (_fives * 5) - (_twos * 2));

            return (_hundreds, _fifties, _twenties, _tens, _fives, _twos, _ones);
        }

        public static (int hours, int minutes, int seconds) Exercise17_ConvertToHourMinutesSeconds(int seconds)
        {
            var _hours = seconds / 3600;
            var _minutes = (seconds - (_hours * 3600)) / 60;
            var _seconds = (seconds - (_hours * 3600) - (_minutes * 60));

            return (_hours, _minutes, _seconds);
        }

        public static (int years, int months, int days) Exercise18_ConvertToYearMonthDays(int days)
        {
            var _years = days / 365;
            var _months = (days - (_years * 365)) / 30;
            var _days = (days - (_years * 365) - (_months * 30));

            return (_years, _months, _days);
        }

        public static string Exercise19_IntegerMultipleConditions(int p, int q, int r, int s)
        {
            if (q > 0 && r > 0 && s > 0 && p % 2 == 0 &&
                q > r && s > p && r + s > p + q)
            {
                return "Correct values";
            }
            
            return "Wrong values";
        }

        /// <summary>
        /// Note on Quadratic Equation
        /// 
        /// if b^2 - 4ac < 0, no real number solution
        /// if b^2 - 4ac = 0, same roots
        /// if b^2 - 4ac > 0
        /// 
        /// </summary>
        /// <param name="a"></param>
        /// <param name="b"></param>
        /// <param name="c"></param>
        /// <returns></returns>
        public static (bool isValid, double root1, double root2) Exercise20_FindRoots(double a, double b, double c)
        {

            var discriminant = (b * b) - (4 * a * c);

            var _root1 = ((-1 * b) + Math.Sqrt(discriminant)) / (2 * a);
            var _root2 = ((-1 * b) - Math.Sqrt(discriminant)) / (2 * a);

            return (discriminant >= 0, _root1, _root2);
        }

        public static (bool isValid, int lowerLimit, int higherLimit) Exercise21_FindRange(int number)
        {
            if (number >= 0 && number <= 20)
            {
                return (true, 0, 20);
            }
            else if (number >= 21 && number <= 40)
            {
                return (true, 21, 40);
            }
            else if (number >= 41 && number <= 60)
            {
                return (true, 41, 60);
            }
            else if (number >= 61 && number <= 80)
            {
                return (true, 61, 80);
            }
            else
            {
                return (false, 0, 0);
            }
        }

        public static int Exercise22_ComputeOddNumberSum(int[] numbers)
        {
            var sum = 0;
            for (int i = 0; i < numbers.Length; i++)
            {
                if (numbers[i] % 2 == 1)
                    sum += numbers[i];
            }

            return sum;
        }

        
        public static (bool isValid, double perimeter) Exercise23_ComputeTrianglePerimeter(double a, double b, double c)
        {
            if ((a + b > c) && 
                (a + c > b) && 
                (b + c > a))
                return (true, a + b + c);

            else 
                return (false, 0);
        }

        public static bool Exercise24_IsMultiplied(int a, int b)
        { 
            if(a >= b && a % b == 0)
                return true;

            if (b > a && b % a == 0)
                return true;

            return false;
        }

        public static string Exercise25_ConvertToMonthString(int month)
        {
            if (month == 1) return "January";
            else if (month == 2) return "February";
            else if (month == 3) return "March";
            else if (month == 4) return "April";
            else if (month == 5) return "May";
            else if (month == 6) return "June";
            else if (month == 7) return "July";
            else if (month == 8) return "August";
            else if (month == 9) return "September";
            else if (month == 10) return "October";
            else if (month == 11) return "November";
            else if (month == 12) return "December";
            else return null;
            
        }

        public static int[] Exercise26_GetEvenNumbers(int lowerLimit, int upperLimit)
        {
            List<int> evenNumbers = new List<int>();

            for (var i = lowerLimit; i <= upperLimit; i++)
            {
                if (i % 2 == 0) evenNumbers.Add(i);
            }

            return evenNumbers.ToArray();
        }

        public static (int negativeCount, int positiveCount) Exercise27_CountNegativePositiveNumbers(int[] numbers)
        {
            int _negativeCount = 0;
            int _positiveCount = 0;
            for (var i = 0; i < numbers.Length; i++)
            {
                if (numbers[i] < 0) _negativeCount++;
                else _positiveCount++;
            }

            return (_negativeCount, _positiveCount);
        }

        public static (int positiveCount, double positiveAverage) Exercise28_GetPositiveCountAndAverage(int[] numbers)
        {
            int _positiveCount = 0;
            double _positiveSum = 0;
            for (var i = 0; i < numbers.Length; i++)
            {
                if (numbers[i] >= 0) 
                {
                    _positiveCount++;
                    _positiveSum += numbers[i];
                }
            }

            double _positiveAverage = Math.Round(_positiveSum / _positiveCount, 2);

            return (_positiveCount, _positiveAverage);
        }

        public static int Exercise29_SumOddNumbers(int[] numbers)
        {
            var sum = 0;
            for (int i = 0; i < numbers.Length; i++)
            {
                if (numbers[i] % 2 == 1)
                    sum += numbers[i];
            }

            return sum;
        }

        public static int[] Exercise30_SquareEvenNumbers(int number)
        {
            List<int> squareEvenNumbers = new List<int>();
            for (int i = 1; i <= number; i++)
            {
                if (i % 2 == 0)
                    squareEvenNumbers.Add(i * i);
            }

            return squareEvenNumbers.ToArray();
        }

        public static string Exercise31_CheckInteger(int number)
        {
            if (number >= 0 && number % 2 == 0) return "Positive Even";
            else if (number > 0 && number % 2 != 0) return "Positive Odd";
            else if (number < 0 && number % 2 == 0) return "Negative Even";
            else if (number < 0 && number % 2 != 0) return "Negative Odd";
            else return null;
        }

        public static int[] Exercise32_CheckNumberWithRemainder3(int number)
        {
            List<int> withRemainder3 = new List<int>();

            for (var i = 0; i <= 100; i++)
            {
                if (i % number == 3)
                {
                    withRemainder3.Add(i);
                }
            }

            return withRemainder3.ToArray();
        }

        public static (int highestNumber, int position) Exercise33_FindHighestNumberPosition(int[] number)
        {
            var _highestNumber = number[0];
            var _position = 1;
            for (var i = 1; i < number.Length; i++)
            {
                if (number[i] > _highestNumber)
                {
                    _highestNumber = number[i];
                    _position = i + 1;
                }
            }

            return (_highestNumber, _position);

        }

        public static (int[] oddNumbers, int sumOfOddNumbers) Exercise34_SumOddNumbers(int firstNumber, int secondNumber)
        {
            List<int> _oddNumbers = new List<int>();
            var _sumOfOddNumbers = 0;

            var lowerNumber = firstNumber;
            var higherNumber = secondNumber;

            if (firstNumber > secondNumber)
            { 
                lowerNumber = secondNumber;
                higherNumber = firstNumber;
            }

            for (var i = lowerNumber; i <= higherNumber; i++)
            {
                if (i % 2 == 1)
                { 
                    _oddNumbers.Add(i);
                    _sumOfOddNumbers += i;
                }
            }

            return (_oddNumbers.ToArray(), _sumOfOddNumbers);

        }

    }
}
