all tests are passing on my end
there are no tests for the CLI, that is subjective 


-------CLI-----------------
this is in bin/tictactoe
it's honestly unorganized and probably hard to follow because i thought it would just be quick, so i wrote it procedural style but then tried to refactor to OO.

as it stands now this is the error I get when i try and run the program (ruby bin/tictactoe)

/Users/jrogers2/Development/code/ttt-with-ai-project-v-000/lib/game.rb:42:in `block in won?': undefined method `cells' for nil:NilClass (NoMethodError)
  from /Users/jrogers2/Development/code/ttt-with-ai-project-v-000/lib/game.rb:41:in `each'
  from /Users/jrogers2/Development/code/ttt-with-ai-project-v-000/lib/game.rb:41:in `detect'
  from /Users/jrogers2/Development/code/ttt-with-ai-project-v-000/lib/game.rb:41:in `won?'
  from /Users/jrogers2/Development/code/ttt-with-ai-project-v-000/lib/game.rb:36:in `over?'
  from /Users/jrogers2/Development/code/ttt-with-ai-project-v-000/lib/game.rb:83:in `play'
  from bin/tictactoe:80:in `runner'
  from bin/tictactoe:108:in `<main>'

  i think it's caused by @this_game on line 80 in tictactoe. but don't really know how to fix it because @this_game is a game instance and has a board that we can call board.cells on so idk why that error is coming up

--------------  computer class------------------

right now i have move method set to return a random number
if you uncomment the line in this method it should run all the other methods in order of priority
but for some reason when the win method is called on an empty board, it returns an error instead of just moving on to the block then random methods
i think this is because my third_of_three method (which basically returns the winning combo that is two thirds complete) returns nil if there neither player is close to winning. 
but i haven't figured out how to fix this either

this is the current test that is failing and the failure message


  1) Player::Computer #move returns a valid position for the computer to move
     Failure/Error: computer_move = computer.move(board)
     NoMethodError:
       undefined method `detect' for nil:NilClass
     # ./lib/players/computer.rb:28:in `win'
     # ./lib/players/computer.rb:4:in `move'
     # ./spec/05_computer_player_spec.rb:15:in `block (3 levels) in <top (required)>'
