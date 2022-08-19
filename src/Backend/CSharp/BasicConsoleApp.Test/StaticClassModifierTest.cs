using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BasicConsoleApp.Test
{
    [TestClass]
    public class StaticClassModifierTest
    {

        /// <summary>
        /// An static properties belongs to the Class and not to the object instance
        /// </summary>
        [TestMethod]
        public void StaticPropertyTestCount()
        {
            // Arrange
            var object1 = new StaticClassModifier();
            object1.Name = "Steve";
            StaticClassModifier.InstanceCount += 1;

            var object2 = new StaticClassModifier();
            object2.Name = "Bruce";
            StaticClassModifier.InstanceCount += 1;

            int expectedCount = 2;

            // Act
            int actualCount = StaticClassModifier.InstanceCount;

            // Assert
            Assert.AreEqual(expectedCount, actualCount);

        }
    }
}
