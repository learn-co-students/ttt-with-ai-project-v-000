

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
