#include <iostream>
#include <cstring>
#include <cstdlib>
#include <algorithm>
#include <fstream>
#include <vector>

using namespace std;

void removeCharsFromString( string &str, char* charsToRemove ) {
   for ( unsigned int i = 0; i < strlen(charsToRemove); ++i ) {
      str.erase( remove(str.begin(), str.end(), charsToRemove[i]), str.end() );
   }
}

int main(int argc, const char * argv[]){

  int lines = atoi(argv[1]);
  int columns = atoi(argv[2]);

  string intList = argv[3];

  const char* fileName = argv[4];

  for (int i = 0; i < argc; i++) {
    cout << "arg" << i << ": " << argv[i] << endl;
  }

  cout << "Lines: " << lines << endl;
  cout << "Columns: " << columns << endl;
  cout << "intList: " << intList << endl;

  removeCharsFromString(intList,"[],");

  cout << "cleanIntList: " << intList << endl;

  // get the char* using &writable[0] or &*writable.begin()
  vector<char> writable(intList.begin(), intList.end());
  writable.push_back('\0');

  vector<char> newList;

  for (int i = 0; i < lines; i++) {
    for (int j = 0; j < columns; j++) {
      // pointer calculus
      int index = columns*i + j;
      char character = writable[index];
      newList.push_back(character);

      if (j == columns - 1) {
        newList.push_back('\n');
        // intList[index] = intList[index] + '\n';
      }else{
        newList.push_back(' ');
        // intList[index] = intList[index] + ' ';
      }
    }
  }


  ofstream out(fileName);

  for (int i = 0; i < newList.capacity(); i++) {
    cout << newList[i];
    out << newList[i];
  }

  out.close();


  return 0;
}
