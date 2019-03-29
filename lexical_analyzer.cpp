/*
Name: Tejas Dhakad
Roll No: 14

Assignment 2: Write a program in C++ to demonstrate basic syntax of LEX specifications, built in functions and Variables.
*/

#include<iostream>              //header files
#include<fstream>               //file management header file
#include<stdlib.h>              //standard lib
#include<string.h>              //string operation lib
#include<ctype.h>
using namespace std;

int Keyword(char buff[]){                                   //declaring all the keywords used in C++ programming language
    char keywords[33][10]  = {"auto","break","case","char","const","continue","default",    
							"do","double","else","enum","extern","float","for","goto",
							"if","int","long","register","return","short","signed",
							"sizeof","static","struct","switch","typedef","union",
							"unsigned","void","volatile","while","main"};
    int flag;
    flag = 0;
    
    for(int i = 0;i < 33; ++i){                             //Checks the word in buffer with every keyword declared in the above array
        if(strcmp(keywords[i],buff) == 0){
            flag = 1;                                       //Sets flag as 1 if word in buffer is a keyword
            break;
        }
    }
    
    return flag;
}

int main(){

    ifstream f;                                             //Create object of the ifstream class
    f.open("code.txt");                                     //Open the file using the object
    
    char c;
    char buff[30], operators[] = "+-*/%=", separators[] = ",;{}()" ;    //Declare array of operators and separators used in C++ programming language
    int j = 0;
    
    if(!f.is_open()){                                       //Display error message if file cannot be opened
		cout<<"\nError while opening the file";
		exit(0);
	}
    
    while(!f.eof()){                                        //While End of File is not reached
    
        c = f.get();                                        //Get input from file character by character
    
        for(int i = 0; i<= 6; i++){                         //Checks if 'c' is an operator
            if (c == operators[i]){
                cout<<"\n"<<c<<" is a operator";       
            }
        }
        
        for(int i = 0; i <= 4; i++){                        //Checks if 'c' is a separator
            if (c == separators[i]){
                cout<<"\n"<<c<<" is a separator";
            }
        }
        
        if(isalnum(c)){                                     //Checks if 'c' is alphanumeric. If it is, 'c' is added in the buff array
            buff[j++] = c;
        }
        
        if(isdigit(c)){                                     //Checks if 'c' is a number
            cout<<"\n"<<c<<" is a constant";
        }
        
        else if((c == ' ' or c == '\n') and j != 0){        //If 'c' is a blank space or a new line
            buff[j] = '\0';                                 //If it is the last index of buff array is made as NULL
            j = 0;
            
            if(Keyword(buff) == 1){                         //The word in buff is checked if it is a keyword or not 
                cout<<"\n"<<buff<<" is a keyword";
            }
            else{
                cout<<"\n"<<buff<<" is a identifier";
            }
        }
    }
    
    f.close();                                              //File is closed
    
    return 0;
}

/*

--------------------------------------------------------------------------------
C++ Program:

void main ( )
{
int postition , initial , rate ;
postition = initial + rate * 60 ;
}

--------------------------------------------------------------------------------

Output:

void is a keyword
main is a keyword
( is a separator
{ is a separator
int is a keyword
postition is a identifier
, is a separator
initial is a identifier
, is a separator
rate is a identifier
; is a separator
postition is a identifier
= is a operator
initial is a identifier
+ is a operator
rate is a identifier
* is a operator
6 is a constant
0 is a constant
; is a separator
} is a separator

--------------------------------------------------------------------------------
*/
