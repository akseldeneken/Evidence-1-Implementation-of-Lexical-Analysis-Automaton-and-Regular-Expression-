# Evidence 1: Implementation of Lexical Analysis Automaton and Regular Expression.
## Description

For this evidence I chose the Sindarin language, created by J.R.R Tolkien and used in The Lord of the Rings and The Hobbit. “It is the most widely spoken Elvish language in Middle-earth during the Third Age, spoken by Men and Elves alike” ( Sindarin Hub, 2024). It is Welsh inspired and has similar sounds and similar phonotactics.

I specifically chose 5 words of this language :

1. Dina - Means ‘Be Silent’
2. Dol - Meaning ‘Head`, often given to hills and mountains 
3. Dôr - Sindarin for 'land'.
4. Draug - 'wolf'.
5. Drego - Sindarin word which means 'Flee'.

In this evidence, the automaton used to analyze the input words is a Deterministic Finite Automata (DFA). In this type of automaton , for each input character or symbol, there is exactly one transition from the current state to the following one. This ensures that the automaton can only be in one state at a time for a given input sequence.

I implemented  a DFA because the goal is to process the set of words mentioned before and determine whether they are valid based on their characters. Each valid word follows a different and unique path through the states.

## Why a DFA?

- Each input character leads to a unique state, making it easy to determine if the word is valid.
- A DFA is easier to implement compared to a NFA since a Non deterministic Finite Automaton can have multiple possible transitions for the same character.
- Since the automaton only needs to check a specific sequence of states for each word, it is great for this case because we only have a limited set of words that are expected.

## Models

I generated only one automaton for this language, to accept only the specific set of words mentioned before.  With that said, the automaton is only valid for the following alphabet:

∑ = a, D, e, g, i, l, n, o, ô, r, u

Any other character is not accepted.

Here’s the automaton I made:
![Diagrama en blanco (1)](https://github.com/user-attachments/assets/4e02dd77-fc80-4552-a08a-3dca68724699)

This can also be represented using a regular expression, which provides an alternative method of describing the valid words that the automaton accepts.

This automaton can be represented by the following regular expression:

( ^D )(( r( aug | ego )) | ( ina ) | ( ol ) | ( ôr ))

## Implementation

The transitions of the automaton are defined using the move predicate. This specifies how the automaton moves from one stat to another based on the input character.

```prolog
% Basic form: move(InitialState, NextState, Letter).
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
```

Each “move(InitialState, NextState, Letter).” indicates that from a given state, the automaton goes to the “NextState” when it reads the input letter. This defines the valid transitions for each word and the structure of the automaton.

The accepting state of the automaton is defined as:

```prolog
accepting_case(z).
```

This means that if the automaton ends in the “z” state, the word is accepted (true).

The “use_automaton” is the main predicate. It takes a word as input and converts it to a list of characters using “atom_chars” to then call the recursive rule “automatonCheck” to check the letters one by one.

“atom_chars” is a built in predicate that converts an atom into a list of characters.

```prolog
use_automaton(Word) :-
    atom_chars(Word, ListChar), 
    automatonCheck(ListChar, a).
```

The base case represents the situation where the list of letters is empty.

```prolog
automatonCheck([], InitialState) :-
    accepting_case(InitialState).
```

Finally, the recursive rule reads each letter in the input word ,checks the current state and, if a valid transition is possible, it moves to the next state. And this repeats itself until all letters are processed.

```prolog
automatonCheck([Letter| RestChar], InitialState) :-
    move(InitialState, NextState, Letter),
    automatonCheck(RestChar, NextState).
```

All of these, are implemented on the main file sindarin.pl. If the input is in the set of words defined previously  it returns true, otherwise it returns false.
