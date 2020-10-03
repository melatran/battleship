# Battleship

This was a paired project for the backend engineering program at Turing School of Software and Design in Mod 1. Battleship uses Ruby to build a command line implementation of the classic game, Battleship. This is a playable game of Battleship that runs in a REPL interface. The game will allow a single human player to play against a (simplistic) computer player.

## Contributers

(Whitney Kidd)[https://github.com/whitneykidd]
(Melanie Tran)[https://github.com/melatran]

## The Game
Both the Human Player and the Computer have a 4 x 4 board that holds their ships. Each of them has 2 ships: The Cruiser which is 3 cells long and The Submarine which is 2 cells. A board will look like this:

<img width="327" alt="Screen Shot 2020-10-03 at 9 12 41 AM" src="https://user-images.githubusercontent.com/59414750/94995024-a812d700-0558-11eb-90d4-b499f46c9c1d.png">

Each `S` represents part of a ship and each `.` represents an empty space. During the main phase of the game, the computer and the player take turns firing at each other’s ships. The board shown above might look like this after a couple rounds of firing:

<img width="327" alt="Screen Shot 2020-10-03 at 9 14 35 AM" src="https://user-images.githubusercontent.com/59414750/94995055-de505680-0558-11eb-8bcb-58fe08eafe7b.png">

Where `H` represents a hit, `M` represents a shot that missed, and `X` represents a sunken ship.

<img width="327" alt="Screen Shot 2020-10-03 at 9 15 35 AM" src="https://user-images.githubusercontent.com/59414750/94995087-00e26f80-0559-11eb-94a6-5d3c8ab24b59.png">

The Game is over when either the User or Computer sinks both enemy ships
