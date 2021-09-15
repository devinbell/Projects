//this will be a basic code that writes hello world on the console
#include <iostream>
#include <cmath>

using namespace std;

//method to calculate the square
void square(int base){

    cout<< "you entered " << base << " and that number squared is " << pow(base, 2); 
}

//main method
int main(){
    /*for loop that starts integer i at 0 and increments it
    until it equals three*/ 
    for(int i=0; i<=3; i++){
        cout << i <<" Hello World" << endl ;
    }

    //test square method
    square(12);
   
    return 0;
}