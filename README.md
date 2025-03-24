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
