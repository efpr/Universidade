#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "ya.h"

struct t_decls_
{
    enum
    {
        DECLS_ONE_DECLARATION,
        DECLS_MORE_THAN_ONE_DECLARATION
    }kind;
    struct
    {
        t_decl t_arg0;
        t_decls t_arg1;
    }u;
};

struct t_decl_
{
    enum
    {
        DECL_ASSIGN_WITH_NO_VALUE,
        DECL_ASSIGN_WITH_VALUE,
        DECL_FUNC_WITHOUT_ARGS,
        DECL_FUNC_WITH_ARGS,
        DECL_DEFINE
    }kind;
    union
    {
        struct
        {
            t_ids t_arg0;
            t_type t_arg1;
            t_exp t_arg2;
        }assign;
        struct
        {
            char* id;
            t_argdefs t_arg0;
            t_type t_arg1;
            t_stmts t_arg2;
        }function;
    }u;
};

struct t_ids_
{
    enum
    {
        ID_ONE,
        ID_MORE_THAN_ONE
    }kind;
    struct
    {
        char* id;
        t_ids t_arg0;
    }u;
};

struct t_type_
{
    enum
    {
        TYPE_INT,
        TYPE_FLOAT,
        TYPE_STRING,
        TYPE_BOOL,
        TYPE_VOID,
        TYPE_ARRAY,
    }kind;
    struct
    {
        int lint;
        t_type t_arg0;
    }u;
};

struct t_argdefs_
{
    enum
    {
        ARGDEFS_ONE_ARG,
        ARGDEFS_MORE_THAN_ONE_ARG
    }kind;
    struct
    {
        t_argdef t_arg0;
        t_argdefs t_arg1;
    }u;
};

struct t_argdef_
{
    enum
    {
        ARGDEF
    }kind;
    struct
    {
        char* id;
        t_type t_arg0;
    }u;
};


struct t_literais_
{
    enum
    {
        LITERAIS_INT,
        LITERAIS_FLOAT,
        LITERAIS_STRING,
        LITERAIS_BOOL
    }kind;
    union
    {
        struct
        {
            int t_arg0;
        }_int;
        struct
        {
            float t_arg0;
        }_float;
        struct
        {
            char* t_arg0;
        }_string;
    }u;
};

struct t_stmts_
{
    enum
    {
        STMTS_ONE_STMT,
        STMTS_MORE_THAN_ONE_STMT
    }kind;
    struct
    {
        t_stmt t_arg0;
        t_stmts t_arg1;
    }u;
};

struct t_stmt_
{
    enum
    {
        STMT_DECL,
        STMT_FUNCTION,
        STMT_ASSIGN,
        STMT_IF,
        STMT_IF_ELSE,
        STMT_WHILE,
        STMT_RETURN,
        STMT_BREAK,
        STMT_NEXT,
        STMT_PRINT,
        STMT_INPUT
    }kind;
    union
    {
        struct
        {
            t_decl t_arg0;
        }stmt1;
        struct
        {
            char* id;
            t_exp t_arg0;
        }stmt2;
        struct
        {
            t_exp t_arg0;
            t_stmts t_arg1;
            t_stmts t_arg2;
        }stmt3;
    }u;
};

struct t_exp_
{
    enum
    {
        EXP_ID,
        EXP_LITERAIS,
        EXP_ADD,
        EXP_SUB,
        EXP_MULT,
        EXP_DIV,
        EXP_MOD,
        EXP_POT,
        EXP_EQUAL,
        EXP_DIFFETENT,
        EXP_LESS,
        EXP_BIGGER,
        EXP_LESS_OR_EQUAL,
        EXP_BIGGER_OR_EQUAL,
        EXP_AND,
        EXP_OR,
        EXP_NOT,
        EXP_NEGATION,
        EXP_PARENTESES,
        EXP_FUNCTION
    }kind;
    union
    {
        struct
        {
            char* id;
        }exp_1;
        struct
        {
            t_literais t_arg0;
        }exp_2;
        struct
        {
            t_exp t_arg0;
            t_exp t_arg1;
        }exp_3;
        struct
        {
            char* id;
            t_exp t_arg0;
        }exp_4;
    }u;
};
//#############################################################
t_decls T_decls_declaration(t_decl arg0, t_decls arg1)
{
    t_decls ret = (t_decls) malloc(sizeof(*ret));

    if(arg1 == NULL)
    {
        ret->kind = DECLS_ONE_DECLARATION;
        ret->u.t_arg0 = arg0;
        return ret;
    }

    ret->kind = DECLS_MORE_THAN_ONE_DECLARATION;
    ret->u.t_arg0 = arg0;
    ret->u.t_arg1 = arg1;

    return ret;
}
//#############################################################
t_decl T_decl_variable(t_ids arg0, t_type arg1, t_exp arg2)
{
    t_decl ret = (t_decl) malloc(sizeof(*ret));

    if(arg2 == NULL)
    {
        ret->kind = DECL_ASSIGN_WITH_NO_VALUE;
        ret->u.assign.t_arg0 = arg0;
        ret->u.assign.t_arg1 = arg1;
        return ret;
    }

    ret->kind = DECL_ASSIGN_WITH_VALUE;
    ret->u.assign.t_arg0 = arg0;
    ret->u.assign.t_arg1 = arg1;
    ret->u.assign.t_arg2 = arg2;
    return ret;
}

t_decl T_decl_func_def(char* arg3, t_argdefs arg0, t_type arg1, t_stmts arg2)
{
    t_decl ret = (t_decl) malloc(sizeof(*ret));

    if(arg2 == NULL)
    {
        ret->kind = DECL_DEFINE;
        ret->u.function.id = arg3;
        ret->u.function.t_arg1 = arg1;
        return ret;
    }
    if(arg0 == NULL)
    {
        ret->kind = DECL_FUNC_WITHOUT_ARGS;
        ret->u.function.id = arg3;
        ret->u.function.t_arg1 = arg1;
        ret->u.function.t_arg2 = arg2;
        return ret;
    }

    ret->kind = DECL_FUNC_WITH_ARGS;
    ret->u.function.id = arg3;
    ret->u.function.t_arg0 = arg0;
    ret->u.function.t_arg1 = arg1;
    ret->u.function.t_arg2 = arg2;
    return ret;
}
//#############################################################
t_ids T_ids_id(t_ids arg0, char* arg1)
{
    t_ids ret = (t_ids) malloc(sizeof(*ret));

    if(arg0 = NULL)
    {
        ret->kind = ID_ONE;
        ret->u.id = arg1;
        return ret;
    }

    ret->kind = ID_MORE_THAN_ONE;
    ret->u.t_arg0 = arg0;
    ret->u.id = arg1;
    return ret;
}
//#############################################################
t_type T_type_def(t_type arg0, int arg1, int arg2)
{
    t_type ret = (t_type) malloc(sizeof(*ret));

    if(arg1 == -1)
    {
        ret->kind = TYPE_ARRAY;
        ret->u.lint = arg2;
        ret->u.t_arg0 = arg0;
        return ret;
    }

    ret->kind = arg1;
    return ret;
}
//#############################################################
t_argdefs T_argdefs_def(t_argdef arg0, t_argdefs arg1)
{
    t_argdefs ret = (t_argdefs) malloc(sizeof(*ret));

    if(arg1 == NULL)
    {
        ret->kind = ARGDEFS_ONE_ARG;
        ret->u.t_arg0 = arg0;
        return ret;
    }

    ret->kind = ARGDEFS_MORE_THAN_ONE_ARG;
    ret->u.t_arg0 = arg0;
    ret->u.t_arg1 = arg1;
    return ret;
}
//#############################################################
t_argdef T_argdef_def(t_type arg0, char* arg1)
{
    t_argdef ret = (t_argdef) malloc(sizeof(*ret));

    ret->kind = ARGDEF;
    ret->u.t_arg0 = arg0;
    ret->u.id = arg1;
    return ret;
}
//#############################################################
t_literais T_literais_int_bool(int arg0, int arg1)
{
    t_literais ret = (t_literais) malloc(sizeof(*ret));

    ret->kind = arg0;
    ret->u._int.t_arg0 = arg1;
    return ret;
}

t_literais T_literais_string(char* arg0)
{
    t_literais ret = (t_literais) malloc(sizeof(*ret));

    ret->kind = LITERAIS_STRING;
    ret->u._string.t_arg0 = arg0;
    return ret;
}

t_literais T_literais_float(float arg0)
{
    t_literais ret = (t_literais) malloc(sizeof(*ret));

    ret->kind = LITERAIS_FLOAT;
    ret->u._float.t_arg0 = arg0;
    return ret;
}
//#############################################################
t_stmts T_stmts_def(t_stmt arg0, t_stmts arg1)
{
    t_stmts ret = (t_stmts) malloc(sizeof(*ret));

    if(arg1 == NULL)
    {
        ret->kind = STMTS_ONE_STMT;
        ret->u.t_arg0 = arg0;
        return ret;
    }

    ret->kind = STMTS_MORE_THAN_ONE_STMT;
    ret->u.t_arg0 = arg0;
    ret->u.t_arg1 = arg1;
    return ret;
}
//#############################################################
t_stmt T_stmt_decl(t_decl arg0)
{
    t_stmt ret = (t_stmt) malloc(sizeof(*ret));

    ret->kind = STMT_DECL;
    ret->u.stmt1.t_arg0 = arg0;
    return ret;
}

t_stmt T_stmt_id(char* arg0, t_exp arg1, int arg2)
{
    t_stmt ret = (t_stmt) malloc(sizeof(*ret));

    ret->kind = arg2;
    ret->u.stmt2.id = arg0;
    ret->u.stmt2.t_arg0 = arg1;
    return ret;
}

t_stmt T_stmt_all(t_exp arg0, t_stmts arg1, t_stmts arg2, int arg3)
{
    t_stmt ret = (t_stmt) malloc(sizeof(*ret));

    ret->kind = arg3;
    ret->u.stmt3.t_arg0 = arg0;

    if(arg1 != NULL)
        ret->u.stmt3.t_arg1 = arg1;
    if(arg2 != NULL)
        ret->u.stmt3.t_arg2 = arg2;

    return ret;
}

t_stmt T_stmt_empty(int arg0)
{
    t_stmt ret = (t_stmt) malloc(sizeof(*ret));

    ret->kind = arg0;
    return ret;
}
//#############################################################
t_exp T_exp_one_id(char* arg0)
{
    t_exp ret = (t_exp) malloc(sizeof(*ret));

    ret->kind = EXP_ID;
    ret->u.exp_1.id = arg0;
    return ret;
}

t_exp T_exp_one_literais(t_literais arg0)
{
    t_exp ret = (t_exp) malloc(sizeof(*ret));

    ret->kind = EXP_LITERAIS;
    ret->u.exp_2.t_arg0 = arg0;
    return ret;
}

t_exp T_exp_exp(t_exp arg0, t_exp arg1, int arg2)
{
    t_exp ret = (t_exp) malloc(sizeof(*ret));

    ret->kind = arg2;
    if(arg0 != 0)
        ret->u.exp_3.t_arg0 = arg0;
    ret->u.exp_3.t_arg1 = arg1;
    return ret;
}

t_exp T_exp_id(char* arg0, t_exp arg1)
{
    t_exp ret = (t_exp) malloc(sizeof(*ret));

    ret->kind = EXP_FUNCTION;
    ret->u.exp_4.id = arg0;
    ret->u.exp_4.t_arg0 = arg1;
    return ret;
}
