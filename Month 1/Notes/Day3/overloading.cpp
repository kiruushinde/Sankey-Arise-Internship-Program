#include <iostream>
using namespace std;

class A
{
public:
    int a;
    int b;
    int sum()
    {
        return a + b;
    }

    void operator+(A &obj)
    {
        int val1 = this->a;
        int val2 = obj.a;

        cout << val1 << " " << val2 << endl;
        cout << val1 - val2;
    }
};

int main()
{
    A obj, obj2;
    obj.a = 3;
    obj2.a = 3;

    // cout << obj.sum();
    obj.a + obj2.a;
    return 0;
}