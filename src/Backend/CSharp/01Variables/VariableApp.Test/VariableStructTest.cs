namespace VariableApp.Test
{
    public class VariableStructTest
    {
        [Fact]
        public void VariableStruct_TestValueType()
        {
            // Arrange
            var myVariableStruct1 = new VariableStruct();
            myVariableStruct1.MyIntegerProperty = 1;
            myVariableStruct1.MyStringProperty = "One";

            // Act
            var myVariableStruct2 = myVariableStruct1;
            myVariableStruct2.MyIntegerProperty = 2;
            myVariableStruct2.MyStringProperty = "Two";

            // Assert
            Assert.Equal(1, myVariableStruct1.MyIntegerProperty);
            Assert.Equal("One", myVariableStruct1.MyStringProperty);

            // If type is a value type, the variable for an object is holding the actual value.
            // In the above example, "myVariableClass1" and "myVariableClass2" are holding the actual value.
            // Thus, copying "myVariableStruct1" to "myVariableStruct2" will copy the actual value.
            // Then, changing the value of "myVariableStruct2" will not have any effect to the value of the "myVariableStruct1"
        }
    }
}