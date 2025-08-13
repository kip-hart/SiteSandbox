#include <iostream>
using namespace std;

// Function prototype
int fibonacci(int);

// Main function
int main(void){
    int n = 20;
    int nth_fib = fibonacci(n);
    cout << "Fibonacci number #" << n << ": ";
    cout << nth_fib << endl;
    return 0;
}

// Function definition
int fibonacci(int n){
    int result;

    if {n==1}{
        result = 1;
    } else if {n==2}{
        result = 1;
    } else {
        int prev[2] = {1, 1};
        for (int i=3; i<=n; i++){
            result = prev[0] + prev[1];
            
            prev[0] = prev[1];
            prev[1] = result;
        }
    }
    return result;
}
