#include <iostream>
using namespace std;

class A
{
public:
    string name;

    void displayInfo()
    {
        cout << "This is class 1";
    }
};

class B
{
public:
    string surname;

    void displayInfo()
    {
        cout << "This is class 2";
    }
};

class C : public A, public B
{
public:
};

int main()
{
    C c1;
    // c1.displayInfo();// --> this is ambiguous
    c1.A::displayInfo();
    return 0;
}