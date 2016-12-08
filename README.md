# Tic Tac Toe with AI


## Overview

This is a CLI Tic Tac Toe game with a working Computer player.

There are 4 game modes: 0 Player, 1 Player, 2 Player and Wargames mode.

  - A 0 player game has two computer players playing against each other with no interaction from the user.
  - A 1 player game has a human playing against a computer.
  - A 2 player game has two human players.
  - For the wargames mode just type 'wargames' when prompted for the number of players, the computer will play 100 gmaes against each other, displaying the total tally of wins vs. draws at the end.

## Instructions

To play, clone this repository run `bundle istall` and then run `bin/tictactoe` in your command line from the root directory.

### Project Structure

```
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── bin
│   └── tictactoe
├── config
│   └── environment.rb
├── lib
    ├── players
        ├── computer.rb
        └── human.rb
    ├── board.rb
    ├── game.rb
    └── player.rb
└── spec
    ├── 01_board_spec.rb
    ├── 02_player_spec.rb
    ├── 03_human_player_spec.rb
    ├── 04_game_spec.rb
    ├── 05_computer_player_spec.rb
    └── spec_helper.rb
```
------------

This game was made as part of the Learn.co curriculum. 

You can read the following 2 blog posts for some of my thoughts on coding this game:

https://blog.yechiel.me/tic-tac-tips-517d5c80f47d#.q4mkp2lbn

https://blog.yechiel.me/puts-solution-61f4eef49bc1#.gcy9ucr87

You can read more about my journy at https://blog.yechiel.me/ or learn more about me and get in touch at https://yechiel.me

<a href='https://learn.co/lessons/ttt-with-ai-project' data-visibility='hidden'>View this lesson on Learn.co</a>

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/ttt-with-ai-project'>Tic-Tac-Toe with AI</a> on Learn.co and start learning to code for free.</p>
