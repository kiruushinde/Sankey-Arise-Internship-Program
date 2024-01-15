#include <iostream>
using namespace std;

// single inheritance
class sample
{
public:
    string name;

    void info()
    {
        cout << "this is base class" << endl;
    }
};

class B : public sample
{
public:
    B()
    {
        cout << "This is derived class.." << endl;
    }
};

// multiple inheritance
class Mother
{
public:
    string name;
    string color;
    string eyeType;

    Mother()
    {
        cout << "This is mother class" << endl;
    }
};

class Father
{
public:
    string noseType;
    string height;

    Father()
    {
        cout << "this is father class " << endl;
    }
};

class child : public Mother, public Father
{
public:
    string newNose;

    void info()
    {
        cout << "this is child class" << endl;
    }
};

// multilevel inheritance
class vehicle
{
public:
    int wheels;
    bool engine;
    bool headlight;
};

class fourWheelCar : public vehicle
{
public:
    string model;
    int year;

    void displayInfo()
    {
        cout << "engine : " << engine << endl;
        cout << "headlight : " << headlight << endl;
        cout << "model : " << model << endl;
        cout << "wheels : " << wheels << endl;
        cout << "year : " << year << endl;
    }
};

class twoWheelBike : public fourWheelCar
{
public:
    string model;
    int mileage;

    void displayInfo()
    {
        cout << "engine : " << engine << endl;
        cout << "headlight : " << headlight << endl;
        cout << "mileage : " << mileage << endl;
        cout << "model : " << model << endl;
        cout << "wheels : " << wheels << endl;
        cout << "year : " << year << endl;
    }
};

int main()
{
    // single inheritance
    B b1;
    b1.info();

    // multiple inheriance
    child c;
    c.info();

    // multilevel inheritance

    twoWheelBike b;
    b.engine = true;
    b.headlight = true;
    b.mileage = 60;
    b.model = "Hero Honda";
    b.wheels = 2;
    b.year = 2002;

    b.displayInfo();

    fourWheelCar f;
    f.engine = 1;
    f.headlight = 1;
    f.model = "Harrier";
    f.wheels = 4;

    f.displayInfo();
    return 0;
}