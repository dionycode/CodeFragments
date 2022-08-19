namespace ReferenceTypeApp.Test
{
    public class ReferenceTypePersonTest
    {
        [Fact]
        public void ObjectReferenceTestValue()
        {
            // Arrange
            int valueType1 = 3;

            int valueType2 = valueType1;
            valueType2 = 5;


            var referenceType1 = new ReferenceTypePerson();
            referenceType1.Name = "Steve";

            var referenceType2 = referenceType1;
            referenceType2.Name = "Clint";

            // Act

            // Assert

            // The value of valueType1 should remain 3
            Assert.Equal(3, valueType1);

            // The value of referenceType1 should be "Clint" 
            Assert.Equal("Clint", referenceType1.Name);
        }
    }
}