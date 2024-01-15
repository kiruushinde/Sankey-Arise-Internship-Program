#include <iostream>
using namespace std;

// friend class
class Sample
{
private:
    int private_variable;

protected:
    int protected_variable;

public:
    void setter()
    {
        private_variable = 10;
        protected_variable = 20;
    }

    friend class F;

    friend void friendFunction(Sample &obj);
};

class F
{
public:
    void displayInfo(Sample &obj)
    {
        cout << "private member is : " << obj.private_variable << endl;
        cout << "protected member is : " << obj.protected_variable << endl;
    }
};

void friendFunction(Sample &obj)
{
    cout << "private varialbe : " << obj.private_variable << endl;
    cout << "Protected variable " << obj.protected_variable << endl;
}
int main()
{
    Sample s;
    s.setter();
    F f;
    f.displayInfo(s);

    // this can be a global function, so you can call it directly
    friendFunction(s);
    return 0;
}