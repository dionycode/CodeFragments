namespace DecisionApp.Test
{
    public class ElectionValidatorTest
    {
        [Fact]
        public void CanPersonVoteIfElse_TestValid()
        {
            // Arrange
            var electionValidator = new ElectionValidator();
            var expectedMessage = "The person can vote";

            // Act
            var result = electionValidator.CanPersonVoteIfElse(21);

            // Assert
            Assert.True(result.success);
            Assert.Equal(expectedMessage, result.message);
        }

        [Fact]
        public void CanPersonVoteIfElse_TestInvalid()
        {
            // Arrange
            var electionValidator = new ElectionValidator();
            var expectedMessage = "Sorry, you cannot vote";

            // Act
            var result = electionValidator.CanPersonVoteIfElse(17);

            // Assert
            Assert.False(result.success);
            Assert.Equal(expectedMessage, result.message);
        }

        [Fact]
        public void CanPersonVoteSwitchCase_TestValid()
        {
            // Arrange
            var electionValidator = new ElectionValidator();
            var expectedMessage = "The person can vote";

            // Act
            var result = electionValidator.CanPersonVoteSwitchCase(21);

            // Assert
            Assert.True(result.success);
            Assert.Equal(expectedMessage, result.message);
        }

        [Fact]
        public void CanPersonVoteSwitchCase_TestInvalid()
        {
            // Arrange
            var electionValidator = new ElectionValidator();
            var expectedMessage = "Sorry, you cannot vote";

            // Act
            var result = electionValidator.CanPersonVoteSwitchCase(17);

            // Assert
            Assert.False(result.success);
            Assert.Equal(expectedMessage, result.message);
        }

        [Fact]
        public void CanPersonVoteTernary_TestValid()
        {
            // Arrange
            var electionValidator = new ElectionValidator();
            var expectedMessage = "The person can vote";

            // Act
            var result = electionValidator.CanPersonVoteTernary(21);

            // Assert
            Assert.True(result.success);
            Assert.Equal(expectedMessage, result.message);
        }

        [Fact]
        public void CanPersonVoteTernary_TestInvalid()
        {
            // Arrange
            var electionValidator = new ElectionValidator();
            var expectedMessage = "Sorry, you cannot vote";

            // Act
            var result = electionValidator.CanPersonVoteTernary(17);

            // Assert
            Assert.False(result.success);
            Assert.Equal(expectedMessage, result.message);
        }
    }
}