using Domain;
using FluentAssertions;
namespace CalculatorTest
{
    public class CalculatorTests
    {
        [Fact]
        public void Sum_TwoPlusTwo_ReturnsFour() =>
            new Calculator().Sum(2, 2).Should().Be(4);
        
        //public void Sum_TwoPlusTwo_ReturnsFour()
        //{
        //    var calculator = new Calculator();
        //    var result = calculator.Sum(2, 2);

        //    result.Should().Be(4);
        //}
    }
}
