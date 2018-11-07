#Define a class `Players::Computer` that represents a computer player of Tic-tac-toe. Implement a `#move` method
#that accepts a board and returns the move the computer wants to make in the form of a 1-9 string. How the
#computer decides to make that move is up to you but it must be capable of returning a valid move at some point.

#```ruby
#def move(board)
#  "1"
#end
#```

#Returns a valid move for the first move but after that your program will go into an infinite loop because the
#computer will constantly try to occupy the `"1"` position in the board even though it is already occupied. So
#don't do that.

#Think about the levels of intelligence you can build into this method. Start with the simplest level of
#intelligence, and get more and more complicated. Each step of the way you should have a working computer player
#though.

#Remember, Tic-tac-toe when played perfectly is unwinnable. You should strive to build computer logic that when
#the computer plays, the game is unwinnable. You can hardcode your logic, things like "On turn 1 always try to go
#in the middle if you can" and if not "try to go in a corner" or any logic tree you can think of - there is an
#algorithm called Min/Max, but it's going to be hard to implement given our current implementation of a Game,
#so we recommend building something that's a more colloquial or condition-based algorithm.

module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def move(board)
      #first turn - try to get the middle
      #check if opponent occcupies 2 of 3 in win combo. Take 3rd spot
      if !board.taken?("5")
        "5"
      elsif !board.taken?("1")
        "1"
      elsif !board.taken?("9")
        "9"
      elsif !board.taken?("3")
        "3"
      elsif !board.taken?("7")
        "7"
      elsif !board.taken?("2")
        "2"
      elsif !board.taken?("8")
        "8"
      elsif !board.taken?("5")
        "5"
      elsif !board.taken?("4")
        "4"
      elsif !board.taken?("6")
        "6"
      end
    end
  end
end
