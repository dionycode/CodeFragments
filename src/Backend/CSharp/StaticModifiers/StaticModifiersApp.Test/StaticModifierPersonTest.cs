namespace StaticModifiersApp.Test
{
    public class StaticModifierPersonTest
    {
        /// <summary>
        /// An static properties belongs to the Class and not to the object instance
        /// </summary>
        /// 
        [Fact]
        public void StaticPropertyTestCount()
        {
            // Arrange
            var object1 = new StaticModifierPerson();
            object1.Name = "Steve";
            StaticModifierPerson.InstanceCount += 1;

            var object2 = new StaticModifierPerson();
            object2.Name = "Bruce";
            StaticModifierPerson.InstanceCount += 1;

            int expectedCount = 2;

            // Act
            int actualCount = StaticModifierPerson.InstanceCount;

            // Assert
            Assert.Equal(expectedCount, actualCount);

        }
    }
}