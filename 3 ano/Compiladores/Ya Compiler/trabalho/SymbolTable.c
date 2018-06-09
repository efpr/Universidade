#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 269

typedef enum
{
    INT,
    FLOAT,
    STRING,
    BOOLEAN,
    VOID,
    ARRAY/*,
    FUCTION*/
}t_type;

typedef struct node node;
typedef struct hashtable hashtable;

struct node
{
    char *id;
    t_type type;
    int empty;
    hashtable *next;
};

struct hashtable
{
    int scope;
    node table[SIZE];
};


////////

hashtable *create_hash()
{
    hashtable *hash =  malloc(sizeof(hashtable));
    hash->scope = -1;

    return hash;
}

int search(hashtable *hash, char *id)
{
    int asci = atoi(id);
    int pos = asci % SIZE;
    while(hash->table[pos].empty != 1)
    {
        pos ++;
    }

    return pos;
}
void change_scope(hashtable *hash, int arg0)
{
    hash->scope = arg0;
}
void insert_variable(hashtable *hash, char *arg0, t_type arg1)
{
    int pos = search(hash,arg0);

    hash->table[pos].id = arg0;
    hash->table[pos].type = arg1;
    hash->table[pos].empty = 1;
}
void insert_fuction(hashtable *hash, char *arg0, t_type arg1/*, ARFUMENTOS */)
{
    int pos = search(hash,arg0);

    hash->table[pos].id = arg0;
    hash->table[pos].type = arg1;
    hash->table[pos].empty = 1;

    hashtable *new_hash = malloc(sizeof(hashtable));
    hash->table[pos].next = new_hash;

    hash->scope = pos;
}
t_type lookup(hashtable *hash, char *id)
{
    if(hash->scope != -1)
    {
        int pos_scope = search(hash->table[hash->scope].next, id);

        while(hash->table[hash->scope].next->table[pos_scope].empty==1)
        {
            if(strcmp(hash->table[hash->scope].next->table[pos_scope].id, id)==0)
                return hash->table[hash->scope].next->table[pos_scope].type;
            pos_scope++;
        }
    }
    int pos = search(hash,id);

    while(hash->table[pos].empty==1)
    {
        if(strcmp(hash->table[pos].id, id)==0)
            return hash->table[pos].type;
        pos++;
    }
    return -1;
}
