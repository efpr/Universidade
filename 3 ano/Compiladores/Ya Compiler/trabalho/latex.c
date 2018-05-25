#include <stdio.h>
#include "latex.h"

void print_prologue()
{
  FILE *fp;

   printf("This will display on the screen.\n");

   if((fp=freopen("apt.tex", "w" ,stdout))==NULL) {
     printf("Cannot open file.\n");
   }

  printf("\\documentclass{standalone}\n"
	 "\\usepackage[utf8]{inputenc}\n"
	 "\\usepackage[T1]{fontenc}\n"
	 "\n"
	 "\\usepackage[margin=1in]{geometry}\n"
	 "\\usepackage{tikz-qtree}\n"
	 "\\usetikzlibrary{shadows,trees}\n"
   "\\newcommand{\\n}{\\textbackslash n}\n"
	 "\\begin{document}\n"
	 "\\tikzset{font=\\small,\n"
	 "level distance=.8cm,\n"
	 "every node/.style=\n"
	 "    {color=white,\n"
	 "    rectangle,rounded corners,\n"
	 "    align=center,\n"
	 "    text = black\n"
	 "    },\n"
	 "edge from parent/.style=\n"
	 "    {draw=blue,\n"
	 "    thick\n"
	 "    }}\n"
	 "\n"
	 "\\centering\n"
	 "\\begin{tikzpicture}\n"
	 "\\Tree ");
}

void print_epilogue()
{
  printf("\\end{tikzpicture}\n"
	 "\\end{document}\n");
}
