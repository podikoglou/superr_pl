?-consult(vm).
?-consult(isa).


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
  % TODO: this doesn't work very well because it doesn't ensure instructions run
  % fine (it can generate instructions that deal with memory locations that are
  % out of bounds)
  length(O, TL),
  maplist(instruction, O),

  % run program and ensure the output memory is the same as the target memory
  % (if not, backtrack and generate another program)
  execute_program(IM, O, TM).
