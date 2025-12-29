% instruction/1
%
% Has three uses:
% 1) Checking the validity of an instruction (when given an instruction as the
%    argument)
%
% 2) Generating all possible arguments an instruction can be given (when given
%    an instruction name with variables in the place of its arguments)
%
% 3) Generating all possible instructions (when given a variable in the place
%    of its argument)

instruction(load(X)) :-
  between(0, 255, X).

instruction(swap(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

instruction(xor(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

instruction(inc(X)) :-
  between(0, 255, X).

instruction(dec(X)) :-
  between(0, 255, X).

instruction(add(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

instruction(sub(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

instruction(put(X)) :-
  between(0, 255, X).
