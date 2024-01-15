#include <iostream>
using namespace std;

class Student
{
public:
    string name;
    int age;
    string gender;

    // this is called as constructor
    Student(string _name)
    {
        name = _name;
    }
    void setInfo(string _name)
    {
        name = _name;
    }
    void getInfo()
    {
        cout << "name : " << name << endl;
        cout << "age : " << age << endl;
        cout << "gender : " << gender << endl;
    }
};

int main()
{
    // Student arr[3]; // creating 3 instances of class

    // for (int i = 0; i < 3; i++)
    // {
    //     cout << "instance " << i + 1 << endl;
    //     cin >> arr[i].name;

    //     cin >> arr[i].age;
    //     cin >> arr[i].gender;
    //     cout << endl;
    // }

    // for (int i = 0; i < 3; i++)
    // {
    //     arr[i].getInfo();
    //     cout << endl;
    // }

    Student s1("Kiran");
    cout << s1.name;
    return 0;
}