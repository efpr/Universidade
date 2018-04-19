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
        DECL_ASSIGN_WITH_NO_VALUE;
        DECL_ASSIGN_WITH_VALUE;
        DECL_FUNC_WITHOUT_ARGS;
        DECL_FUNC_WITH_ARGS;
        DECL_DEFINE;
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
        ID_ONE;
        ID_MORE_THAN_ONE;
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
        TYPE_INT;
        TYPE_FLOAT;
        TYPE_STRING;
        TYPE_BOOL;
        TYPE_VOID;
        TYPE_ARRAY;
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
        ARGDEFS_ONE_ARG;
        ARGDEFS_MORE_THAN_ONE_ARG;
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
        ARGDEF;
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
        LITERAIS_INT;
        LITERAIS_FLOAT;
        LITERAIS_STRING;
        LITERAIS_BOOL;
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
        STMTS_ONE_STMT;
        STMTS_MORE_THAN_ONE_STMT;
    }kind:
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
        STMT_DECL;
        STMT_FUNCTION;
        STMT_ASSIGN;
        STMT_IF;
        STMT_IF_ELSE;
        STMT_WHILE;
        STMT_RETURN;
        STMT_BREAK;
        STMT_NEXT;
        STMT_PRINT;
        STMT_INPUT;
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
        EXP_ID;
        EXP_LITERAIS;
        EXP_ADD;
        EXP_SUB;
        EXP_MULT;
        EXP_DIV;
        EXP_MOD;
        EXP_POT;
        EXP_EQUAL;
        EXP_DIFFETENT;
        EXP_LESS;
        EXP_BIGGER;
        EXP_LESS_OR_EQUAL;
        EXP_BIGGER_OR_EQUAL;
        EXP_AND;
        EXP_OR;
        EXP_NOT;
        EXP_SUB;
        EXP_PARENTESES;
        EXP_FUNCTION;
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
        }exp4;
    }u;
};
