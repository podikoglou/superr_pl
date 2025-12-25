?-consult(vm).

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
