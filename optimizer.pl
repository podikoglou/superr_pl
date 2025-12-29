?-consult(vm).

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
  % this is probably computed multiple times, sucks
  execute_program(IM, P, TM),

  % generate all target lengths ([0..L] where L is the length of the input
  % program)
  length(P, L),
  between(0, L, TL),

  % synthesize for TL
  synthesize(IM, TM, TL, O).

% synthesize/4
%
% IM: initial memory
% TM: target memory
% TL: target length (amount of instruction)
% O:  output program
synthesize(IM, TM, TL, O) :-
  true.
