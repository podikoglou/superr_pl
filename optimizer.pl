?-consult(vm).

% synthesize_instruction/1
%
% generate all possible combinations of instructions

synthesize_instruction(load(X)) :-
  between(0, 255, X).

synthesize_instruction(swap(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

synthesize_instruction(xor(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

synthesize_instruction(inc(X)) :-
  between(0, 255, X).

synthesize_instruction(dec(X)) :-
  between(0, 255, X).

synthesize_instruction(add(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

synthesize_instruction(sub(A, B)) :-
  between(0, 255, A),
  between(0, 255, B).

synthesize_instruction(put(X)) :-
  between(0, 255, X).

% synthesize_from_program/2
%
% P: input program
% O: output program
synthesize_from_program(P, O) :-
  synthesize_from_program([0, 0, 0, 0], P, O).

% synthesize_from_program/3
%
% IM: initial memory
% P:  input program
% O:  output program
synthesize_from_program(IM, P, O) :-
  execute_program(IM, P, TM),
  synthesize(IM, TM, O).

% synthesize/3
%
% IM: initial memory
% TM: target memory
% O:  output program
synthesize(IM, TM, O) :-
  true.
