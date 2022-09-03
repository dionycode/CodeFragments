namespace DateAndTimeApp.Test
{
    public class TimeClassTest
    {
        [Theory]
        [InlineData("08:06:23AM", "08:06:23")]
        [InlineData("08:06:23PM", "20:06:23")]
        [InlineData("12:06:23AM", "00:06:23")]
        [InlineData("12:06:23PM", "12:06:23")]
        public void ConvertTo24_Test_Valid(string inputTime, string expectedResultTime)
        {
            // Arrange
            var timeClass = new TimeClass();

            // Act
            var result = timeClass.ConvertTo24HourFormat(inputTime);
            
            // Assert
            Assert.Equal(expectedResultTime, result);

        }
    }
}