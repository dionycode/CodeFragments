
using VariableApp;

Console.WriteLine("This is Variable App");

// Built-in Types
int integerVariable = 0;
float floatVariable = 0;
decimal decimalVariable = 0;
double doubleVariable = 0;


bool boolVariable = false;
char charVariable = 'd';
string stringVariable = "string value";

// Custom Types
//  Can be created using
//  - class
//  - struc
//  - interface
//  - enum 
//  - record
VariableClass myVariableClass = new VariableClass();
VariableStruct myVariableStruct = new VariableStruct();


// Integer
// Algebraic Equation: 
//      number2 = number1 + 12

// "=" is the assignment operator
// it is used to assign value to the variable
// we must assign value to the variable as early as possible to make it in "valid state"

int number1 = 5;
int number2 = number1 + 12;
Console.WriteLine(number2);


// variable name is case sensitive
// firstname and firstName are two different variables

string firstname = "john";
string firstName = "John";

// "+" is used to contatenate strings

string lastName = "Smith";
string fullName = "Fullname: " + firstName + " " + lastName;
Console.WriteLine(fullName);

