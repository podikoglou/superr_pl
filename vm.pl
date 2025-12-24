% load
execute([_|T], load(X), [X|T]).

% swap
execute(M, swap(A, B), O) :-
  append(BeforeA, [AtA|AfterA], M),
  append(BeforeA, [AtB|AfterA], T),
  length(BeforeA, A),

  append(BeforeB, [AtB|AfterB], T),
  length(BeforeB, B),

  append(BeforeB, [AtA|AfterB], O).

% xor
execute([H|T], xor(AIdx, BIdx), [R|T]) :-
  M = [H|T],
  nth0(AIdx, M, A),
  nth0(BIdx, M, B),
  R is A xor B.

% inc
execute(M, inc(Idx), O) :-
  append(BeforeIdx, [AtIdx|AfterIdx], M),
  length(BeforeIdx, Idx),

  UpdatedAtIdx is AtIdx + 1,

  append(BeforeIdx, [UpdatedAtIdx|AfterIdx], O).

% dec
execute(M, dec(Idx), O) :-
  append(BeforeIdx, [AtIdx|AfterIdx], M),
  length(BeforeIdx, Idx),

  UpdatedAtIdx is AtIdx - 1,

  append(BeforeIdx, [UpdatedAtIdx|AfterIdx], O).

% add
execute(M, add(IdxA, IdxB), O) :-
  same_length(M, O),

  nth0(IdxA, M, A),
  nth0(IdxB, M, B),

  Sum is A + B,

  append(BeforeA, [_|AfterA], M),
  length(BeforeA, IdxA),

  append(BeforeA, [Sum|AfterA], O).

% sub
execute(M, sub(IdxA, IdxB), O) :-
  same_length(M, O),

  nth0(IdxA, M, A),
  nth0(IdxB, M, B),

  Diff is A + B,

  append(BeforeA, [_|AfterA], M),
  length(BeforeA, IdxA),

  append(BeforeA, [Diff|AfterA], O).

% put
execute(M, put(Idx), M) :-
  nth0(Idx, M, X),
  write(X),
  nl.

execute_program(M, [], M).

execute_program(M, [H|T], O) :-
  execute(M, H, O2),
  execute_program(O2, T, O).
