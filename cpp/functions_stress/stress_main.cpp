#include <iostream>
using namespace std;

float normal_stress(float, float);

int main(void){
    float f = 500; // lbf
    float a = 20;  // in^2

    float s = normal_stress(f, a);
    cout << s << " psf" << endl;
}

float normal_stress(float force, float area){
    float sigma = force / area;
    return sigma;
}
