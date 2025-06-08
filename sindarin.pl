move(a,b,d).
move(b,h,i).
move(b,c,r).
move(b,j,o).
move(b,k,ô).
move(c,f,a).
move(c,d,e).
move(h,i,n).
move(j,z,l).
move(k,z,r).
move(f,g,u).
move(d,e,g).
move(i,z,a).
move(g,z,g).
move(e,z,o).

% The automaton accepts the input if it ends in the state z.
accepting_case(z).

% Main predicate that converts the word to a list of characters
use_automaton(Word) :-
    atom_chars(Word, ListChar), % Convert atom to list of characters
    automatonCheck(ListChar, a).
    
% If the list is empty, check if the current state is accepting
automatonCheck([], InitialState) :-
    accepting_case(InitialState).

% Process each character and move to the next state
automatonCheck([Symbol | RestofList], InitialState) :-
    move(InitialState, NextState, Symbol),
    automatonCheck(RestofList, NextState).

% Test cases with words as atoms
dina :-
    write('dina'), nl,
    write('Expected: true'), nl,
    use_automaton(dina).
    
dol :-
    write('dol'), nl,
    write('Expected: true'), nl,
    use_automaton(dol).
    
dôr :-
    write('dôr'), nl,
    write('Expected: true'), nl,
    use_automaton(dôr).
    
draug :-
    write('draug'), nl,
    write('Expected: true'), nl,
    use_automaton(draug).
    
drego :-
    write('drego'), nl,
    write('Expected: true'), nl,
    use_automaton(drego).

run_tests :-
    Valid = [dina, dol, dôr, draug, drego],
    Invalid = [droga, dor, doli, dinha, drauh],
    test_words(Valid, true),
    test_words(Invalid, false).

test_words([], _).
test_words([Word|Rest], Expected) :-
    (   use_automaton(Word)
    ->  Actual = true
    ;   Actual = false
    ),
    (   (Actual == Expected)
    ->  Result = passed
    ;   (Expected == true -> Result = unexpected_fail ; Result = unexpected_pass)
    ),
    format('~w: ~w ~w~n', [Word, Actual, Result]),
    test_words(Rest, Expected).

