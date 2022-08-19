using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BasicConsoleApp.Test
{
    [TestClass]
    public class ReferenceTypeTest
    {
        [TestMethod]
        public void ObjectReferenceTestValue()
        {
            // Arrange
            int valueType1 = 3;

            int valueType2 = valueType1;
            valueType2 = 5;


            var referenceType1 = new ReferenceType();
            referenceType1.Name = "Steve";

            var referenceType2 = referenceType1;
            referenceType2.Name = "Clint";

            // Act

            // Assert

            // The value of valueType1 should remain 3
            Assert.AreEqual(3, valueType1);

            // The value of referenceType1 should be "Clint" 
            Assert.AreEqual("Clint", referenceType1.Name);
        }
    }
}
