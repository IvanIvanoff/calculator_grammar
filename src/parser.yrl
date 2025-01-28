Nonterminals
  grammar
  expr
  dual_arithmetic_op
  mult_arithmetic_op
.

Terminals
  int
  float
  '+' '-' '*' '/' '='
.

Rootsymbol
  grammar
.

%% Precedence
Left 100 '='.
Left 200 dual_arithmetic_op.
Left 300 mult_arithmetic_op.

%% Rules

grammar -> expr : '$1'.

expr -> expr '=' expr : {'=', '$1', '$3'}.
expr -> expr dual_arithmetic_op expr : {'$2', '$1', '$3'}.
expr -> expr mult_arithmetic_op expr : {'$2', '$1', '$3'}.
expr -> int : '$1'.
expr -> float : '$1'.

%% arithmetic operator
dual_arithmetic_op -> '+' : '+'.
dual_arithmetic_op -> '-' : '-'.
mult_arithmetic_op -> '*' : '*'.
mult_arithmetic_op -> '/' : '/'.
