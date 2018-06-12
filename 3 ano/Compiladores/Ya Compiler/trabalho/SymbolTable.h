#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 269

typedef enum
{
    table_INT,
    table_FLOAT,
    table_STRING,
    table_BOOLEAN,
    table_VOID,
    table_ARRAY/*,
    FUCTION*/
}table_type;

typedef struct node node;
typedef struct hashtable hashtable;


hashtable *create_hash();
int search(hashtable *hash, char *id);
void change_scope(hashtable *hash, int arg0);
void insert_variable(hashtable *hash, char *arg0, table_type arg1);
void insert_fuction(hashtable *hash, char *arg0, table_type arg1/*, ARFUMENTOS */);
table_type lookup(hashtable *hash, char *id);
