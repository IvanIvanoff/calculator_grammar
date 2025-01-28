Definitions. 

INT = [0-9]+
FLOAT = [0-9]+\.[0-9]+
WHITESPACE        = [\s\t\n\r]

Rules.

\+                : {token, {'+', TokenLoc}}.
\-                : {token, {'-', TokenLoc}}.
\*                : {token, {'*', TokenLoc}}.
\/                : {token, {'/', TokenLoc}}.
\=                : {token, {'=', TokenLoc}}.
{INT}             : {token, {int, TokenLoc, list_to_integer(TokenChars)}}.
{FLOAT}           : {token, {int, TokenLoc, list_to_float(TokenChars)}}.
{WHITESPACE}+     : skip_token.

Erlang code.
