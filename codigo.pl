% Autor
alumno_prode('Garcia','Encinas','Pablo','T110240').

% Parada de la vibora
vibora(_, _, [], []).

% Predicado de la vibora para una sola fila
vibora(P, C, [_], [R]) :-
	% Unicamente debe comprobar el patron al ser fila impar
	pattern(P, C, R).

% Predicado principal de la vibora que procesa filas de dos en dos
vibora(P, C, [_,_|F], [R1,R2|RT]) :-
	% Comprobar el patron en la fila impar
	pattern(P, C, R1),

	% Rotar el patron tantas veces como columnas haya
	rotate(P, C, P1),
	% Comprobar el patron en la fila par
	pattern(P1, C, R2R),
	% Revertir la fila par
	v_reverse(R2R, R2),

	% Rotar nuevamente el patron
	rotate(P1, C, P2),
	% Recursividad con las filas restantes
	vibora(P2, C, F, RT).


% Predicado pattern/3
% Es cierto si R es el resultado de ciclar el patron tantas veces como elemntos haya en C
pattern(_, [], []).
pattern([PH|PT], [_|C], [PH|RT]) :-
	v_append(PT, [PH], P),
	pattern(P, C, RT).

% Predicado rotate/3
% Es cierto si R es el resultado de rotar la lista tantas veces como elementos haya en C
rotate(L, [], L).
rotate([H|T], [_|C], R) :-
	v_append(T, [H], L),
	rotate(L, C, R).

% Predicado v_append/3
% Es cierto si R resulta de anhadir a la cola de L1 los elementos de L2
v_append([], L, L).
v_append([H|L1], L2, [H|R]) :-
	v_append(L1, L2, R).

% Predicado v_reverse/2
% Es cierto si R resulta de invertir el orden de los elementos de L
v_reverse(L, R) :-
	v_reverse_(L, R, []).

% Predicado v_reverse_/3
% Es cierto si R resulta de invertir el orden de elementos de L mediante un acumulador
v_reverse_([], R, R).
v_reverse_([H|L], R, Acc) :-
	v_reverse_(L, R, [H|Acc]).

