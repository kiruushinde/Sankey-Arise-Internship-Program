#include <iostream>
using namespace std;

/*
    types:
    1. run time
        - function overriding

    2. compile time
        - function overloading
            changing the signature of function
            you cannot achieve it by changing the return type.

        - operator overloading
            following are the operators you cannot overload
            1. :: (scope resulution )
            2. .  (dot)
            3. ?: (ternary operator)
            4. * (multiply)
*/

class goodMorning
{
public:
    string name;

    void sayGm()
    {
        cout << "Hello, Good Morning 🌄 jiii" << endl;
    }
    void sayGm(string name)
    {
        cout << "Hello, Good Morning 🌄" << name << endl;
    }

    void sayGm(int n)
    {
        cout << "Hello " << n << endl;
    }
};

class Animal
{
public:
    void speak()
    {
        cout << "I am speaking ";
    }
};

class Dog : public Animal
{
public:
    // run time polymorphism
    void speak()
    {
        cout << "I am barking";
    }
};

int main()
{
    goodMorning g;
    g.sayGm();
    g.sayGm("utkuuu");
    g.sayGm(23);

    Dog d;
    d.speak();
    return 0;
}