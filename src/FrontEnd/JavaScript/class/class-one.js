
/**************************************/
// Class
// This are blueprint of real-world objects
// This example uses constructor

class Human {
    constructor() {
        this.color = 'red';
    }

    printColor() {
        console.log(this.color);
    }
}

// Person Class inherits Human Class
class Person extends Human {
    constructor() {
        super(); //This is needed. It execute the parent class (Human) constructor
        this.name = 'John Doe'
        this.color = 'blue' // Overriding the value of parent class (Human Class)
    }

    printName() {
        console.log(this.name)        
    }
}

const newPerson = new Person();
newPerson.printName();
newPerson.printColor();
