%option noyywrap

%{
#include <stdio.h>

int result;

int pop();
void push(int val);

float stack[20];
int pointer=0;

%}

NUM [0-9]+

%%

{NUM}	{ push(atoi(yytext));}
"+"		{ result = pop() + pop(); push(result);}
"-"		{ int temp = pop(); result = pop() - temp; push(result);}
"*"		{ result = pop() * pop(); push(result);}
"/"		{ int temp = pop(); result = pop() / temp; push(result);}
[\n\t]+	{ /*ignore whitespace*/}

"show"	{ printf("(%d)\n", pop());}	
.		{ printf("Systax error.\n");}

%%

int main(int argc, char  *argv[])
{
	while(1)
	{
		yylex();
	}
	return 0;
}

int pop()
{
	return stack[--pointer];
}

void push(int val)
{
	stack[pointer++] = val;
}git