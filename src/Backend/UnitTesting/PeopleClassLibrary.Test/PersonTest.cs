using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace PeopleClassLibrary.Test
{
    [TestClass]
    public class PersonTest
    {
        [TestMethod]
        public void FullNameTestValid()
        {
            // Arrange
            Person person = new Person();
            person.FirstName = "Steve";
            person.LastName = "Rogers";

            string expected = "Rogers, Steve";

            // Act
            string actual = person.FullName;


            // Assert
            Assert.AreEqual(expected, actual);

        }

        [TestMethod]
        public void FullNameTestNoFirstName()
        {
            // Arrange
            Person person = new Person();
            person.LastName = "Rogers";

            string expected = "Rogers";

            // Act
            string actual = person.FullName;


            // Assert
            Assert.AreEqual(expected, actual);
        }

        [TestMethod]
        public void FullNameTestNoLastName()
        {
            // Arrange
            Person person = new Person();
            person.FirstName = "Steve";

            string expected = "Steve";

            // Act
            string actual = person.FullName;


            // Assert
            Assert.AreEqual(expected, actual);
        }
    }
}
