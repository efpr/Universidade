CC = gcc
CFLAGS = -g
OUTFILE = out
LIBS =-lm


all: clean compile run-1 run-2 run-6
	@echo '---------------------END---------------------'

compile: parser.c lexer.c yatypes.o latex.o
	$(CC) $(CFLAGS) parser.c lexer.c yatypes.o latex.o -o $(OUTFILE) $(LIBS)

latex.o: latex.h latex.c
	gcc $(CFLAGS) -c latex.c

yatypes.o: yatypes.h yatypes.c
	gcc $(CFLAGS) -c yatypes.c

run-1:
	./$(OUTFILE) < ../yaxamples/example1.ya

run-2:
	./$(OUTFILE) < ../yaxamples/example2.ya

run-6:
	./$(OUTFILE) < ../yaxamples/example6.ya

parser.c: ya.y
		bison -y -v -d $^ -o $@

lexer.c: ya.lex
		flex -o $@ $^

clean:
		@echo '--------------------BEGIN--------------------'
		rm -rf parser.c lexer.c parser.h parser.output
		rm -f out
