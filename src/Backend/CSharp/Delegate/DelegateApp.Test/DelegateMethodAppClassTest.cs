namespace DelegateApp.Test
{
    public class DelegateMethodAppClassTest
    {
        [Fact]
        public void MyAppMethodOneComputeSubTotal_Test()
        {
            // Arrange
            var myAppMethod = new DelegateMethodAppClass();
            myAppMethod.AppItemPrices = new List<decimal> { 2, 4, 6, 8 };
            var expectedResult = 20;

            // Act
            var result = myAppMethod.MyAppMethodOneComputeSubTotal();

            // Assert
            Assert.Equal(expectedResult, result);
        }

        [Fact]
        public void MyAppMethodTwoComputeSubTotal_Test()
        {
            // Arrange
            var myAppMethod = new DelegateMethodAppClass();
            myAppMethod.AppItemPrices = new List<decimal> { 2, 4, 6, 8 };
            var expectedResult = 14;

            // Act
            var result = myAppMethod.MyAppMethodTwoComputeSubTotal();

            // Assert
            Assert.Equal(expectedResult, result);
        }


        [Fact]
        public void MyAppFunctionOneComputeSubTotal_Test()
        {
            // Arrange
            var myAppFunction = new DelegateFunctionAppClass();
            myAppFunction.AppItemPrices = new List<decimal> { 2, 4, 6, 8 };
            var expectedResult = 20;

            // Act
            var result = myAppFunction.MyAppFunctionOneComputeSubTotal();

            // Assert
            Assert.Equal(expectedResult, result);
        }

        [Fact]
        public void MyAppFunctionTwoComputeSubTotal_Test()
        {
            // Arrange
            var myAppFunction = new DelegateFunctionAppClass();
            myAppFunction.AppItemPrices = new List<decimal> { 2, 4, 6, 8 };
            var expectedResult = 14;

            // Act
            var result = myAppFunction.MyAppFunctionTwoComputeSubTotal();

            // Assert
            Assert.Equal(expectedResult, result);
        }
    }
}