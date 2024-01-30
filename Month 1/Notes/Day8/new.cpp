#include <iostream>
using namespace std;

int main()
{
    int a, b, c, d;
    cout << "\nEnter the value of number 1" << endl;
    cin >> a;
    cout << "Enter the value of number 2" << endl;
    cin >> b;
    cout << "Enter the value of number 3" << endl;
    cin >> c;
    cout << "Enter the value of number 4" << endl;
    cin >> d;

    if ((a > b) && (a > c) && (a > d))
    {
        cout << a << " is greater than "
             << ", " << b << ", " << c << ", " << d << endl;
    }

    else if ((b > c) && (b > d))
    {
        cout << b << " is greater than "
             << ", " << a << ", " << c << ", " << d << endl;
    }

    else if ((c > d))
    {
        cout << c << " is greater than "
             << ", " << b << ", " << a << ", " << d << endl;
    }

    else
    {
        cout << d << " is greater than "
             << ", " << b << ", " << a << ", " << c << endl;
    }
    return 0;
}