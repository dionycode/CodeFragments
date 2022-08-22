namespace VariableApp.Test
{
    public class VariableClassTest
    {
        [Fact]
        public void VariableClass_TestReferenceType()
        {
            // Arrange
            var myVariableClass1 = new VariableClass();
            myVariableClass1.MyIntegerProperty = 1;
            myVariableClass1.MyStringProperty = "One";

            // Act
            var myVariableClass2 = myVariableClass1;
            myVariableClass2.MyIntegerProperty = 2;
            myVariableClass2.MyStringProperty = "Two";

            // Assert
            Assert.Equal(2, myVariableClass1.MyIntegerProperty);
            Assert.Equal("Two", myVariableClass1.MyStringProperty);

            // If type is a reference type, the variable for an object is holding the reference to the memory where the actual value is located.
            // In the above example, "myVariableClass1" and "myVariableClass2" are both pointing to the same memory location.

        }

        [Fact]
        public void VariableClass_TestDefaultValue()
        {
            // Arrange
            VariableClass object1; // At this point, variable object1 is null and not yet an object. 
            object1 = new VariableClass(); // At this point, variable object1 is already initialized

            // Act

            // Assert
            Assert.NotNull(object1);
        }

        [Fact]
        public void VariableClass_TestInheritance()
        {
            // Arrange
            ChildClass childObject = new ChildClass();

            // Act
            childObject.MyIntegerProperty = 1;      // Property inherited from the base class "VariableClass"
            childObject.MyStringProperty = "Two";   // Property inherited from the base class "VariableClass"
            childObject.ChildIntegerProperty = 3;

            // Assert
            
        }
    }
}