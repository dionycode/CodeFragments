
/**************************************/
// Class
// This are blueprint of real-world objects

class Human {
    color = 'red';
    

    printColor = () => {
        console.log(this.color);
    }
}

class Person extends Human {
    name = 'John Doe';
    //color = 'blue'; 

    printName = () => {
        console.log(this.name);       
    }
}

const newPerson = new Person();
newPerson.printName();
newPerson.printColor();
