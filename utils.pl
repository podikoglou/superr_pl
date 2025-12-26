write_instruction(load(X)) :-
  write("LOAD "),
  write(X).

write_instruction(swap(A, B)) :-
  write("SWAP "),
  write(A),
  write(" "),
  write(B).

write_instruction(xor(A, B)) :-
  write("SWAP "),
  write(A),
  write(" "),
  write(B).

write_instruction(inc(X)) :-
  write("INC "),
  write(X).

write_instruction(dec(X)) :-
  write("INC "),
  write(X).

write_instruction(add(A, B)) :-
  write("ADD "),
  write(A),
  write(" "),
  write(B).

write_instruction(sub(A, B)) :-
  write("SUB "),
  write(A),
  write(" "),
  write(B).

write_instruction(put(X)) :-
  write("PUT "),
  write(X).

write_program([H|T]) :-
  write_instruction(H),
  nl,
  write_program(T).
