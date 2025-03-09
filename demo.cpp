#include <iostream>
#include <stdlib.h>
#include <unistd.h>

using namespace std;

int main() {

   string str;
   cout << "enter input string: ";
   getline(cin, str);

    if(str[0] == 0) {
        abort(); // crash1
    } else if (str[str.length() - 1] == 0) {
        sleep(10); // hang1
    }

    int count = 0;
    char prev_num = 'x';
    while (count != str.length() - 1) {
        char c = str[count];
        if(c >= '0' && c <= '9') {
            if(c == prev_num + 1) {
                abort(); // crash2
            } else if (c == prev_num + 2) {
                sleep(10); // hang2
            }
            prev_num = c;
        } 
        count++;
    }
    
    return 0;
}