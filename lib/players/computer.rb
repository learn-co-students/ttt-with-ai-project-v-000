## This is not working right, but I need to work on something else for sometime before coming back to it.
## For some reason, it will not detect the winning combination
## Need to reduce repeition
## Need to add in a method that places at random.
## Need to make it so that the computer results in cat's game each time.
#### ---> Currently, the only way to do this has been to run ONLY the 'check_middle' and 'place_elsewhere' methods

## I will come back to this later on and get it to work the way it should.
## I will delete my comments at that time.


require 'pry'

module Players

  class Computer < Player

    ## Figure out how to choose at random
    ##@positions = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def move(board)

      position ||= go_for_victory(board)
      position ||= prevent_defeat(board)
      position ||= check_all(board)
      position ||= check_middle(board)
      position ||= check_corners(board)
      position ||= place_elsewhere(board)

      position.to_s

    end # move

=begin
    0 | 1 | 2
  -------------
    3 | 4 | 5
  -------------
    6 | 7 | 8
=end

=begin
    1 | 2 | 3
  -------------
    4 | 5 | 6
  -------------
    7 | 8 | 9
=end

    ## What would I do as a human playing tic-tac-toe?
    ## I would first try to go in the middle
    ## If the middle still isn't taken during the second turn, I will try to go there
    ## If I get the middle, I will try to take (2, 4, 6, and 8)
    ## If the middle is taken, I will look for the corners (1, 3, 7, 9)
    ## If I have a X/O in:
    ## 1 and 3 && 2 open
    ## 1 and 7 && 4 open
    ## 3 and 9 && 6 open
    ## 7 and 9 && 8 open
    ## then put is there

    ## check if there is an X/O in:
    ## 1 and 2 && 3 open
    ## 1 and 4 && 7 open
    ## 1 and 5 && 9 open
    ## 2 and 5 && 8 open
    ## 2 and 3 && 1 open
    ## 3 and 5 && 7 open
    ## 3 and 6 && 9 open
    ## 4 and 5 && 6 open
    ## 4 and 7 && 1 open
    ## 5 and 6 && 4 open
    ## 5 and 7 && 3 open
    ## 5 and 8 && 2 open
    ## 6 and 9 && 3 open
    ## 7 and 8 && 9 open
    ## 8 and 9 && 7 open

    ### If these positions have my tokens in them, then put it in the third open position
    ### Otherwise, if these positions do not have my tokens in them, then put mine in the third position to block it
    ### In both scenarios, I need to determine which of these combination scenarios are present

    ## preventing opponent from winning
    ## I need to


    def potential_combo(board, player_token)

      Game::WIN_COMBINATIONS.detect do |combination|
        if board.cells[combination[0]] == player_token && board.cells[combination[1]] == player_token
          !board.taken?(combination[2] + 1) ? (combination[2] + 1) : nil

        elsif board.cells[combination[0]] == player_token && board.cells[combination[2]] == player_token
          !board.taken?(combination[1] + 1) ? (combination[1] + 1) : nil

        elsif board.cells[combination[1]] == player_token && board.cells[combination[2]] == player_token
          !board.taken?(combination[0] + 1) ? (combination[0] + 1) : nil

        end # outer if
      end # do |combination|
    end # potential_combo


    def go_for_victory(board)
      position = potential_combo(board, self.token)
      if !position.nil?
        if board.valid_move?(position.to_s)
          position
        end # if valid_move?
      end # if index is nil
    end # go_for_victory


    def opponent_token
      if self.token == 'X'
        'O'
      else
        'X'
      end # if token == 'X' or 'O'
    end # opponent_token


    def prevent_defeat(board)
      position = potential_combo(board, opponent_token)
      if !position.nil?
        if board.valid_move?(position.to_s)
          position
        end # if valid_move?
      end # if index is nil
    end # prevent_defeat


    def check_middle(board)
      if board.valid_move?("5")
        "5"
      end # if middle_taken
    end # check_middle


    def check_corners(board)
      if board.taken?("1") && board.taken?("3")
        if board.valid_move?("2")
          "2"
        end
      elsif board.taken?("1") && board.taken?("7") && board.valid_move?("4")
        "4"
      elsif board.taken?("3") && board.taken?("9") && board.valid_move?("6")
        "6"
      elsif board.taken?("3") && board.taken?("9") && board.valid_move?("8")
        "8"
      elsif board.valid_move?("1")
        "1"
      elsif board.valid_move?("3")
        "3"
      elsif board.valid_move?("7")
        "7"
      elsif board.valid_move?("9")
        "9"
      end # if
    end # check_corners

    def check_all(board)
      if board.taken?("1") && board.taken?("2") && board.valid_move?("3")
        "3"
      elsif board.taken?("1") && board.taken?("4") && board.valid_move?("7")
        "7"
      elsif board.taken?("1") && board.taken?("5") && board.valid_move?("9")
        "9"
      elsif board.taken?("2") && board.taken?("5") && board.valid_move?("8")
        "8"
      elsif board.taken?("2") && board.taken?("3") && board.valid_move?("1")
          "1" ##
      elsif board.taken?("3") && board.taken?("5") && board.valid_move?("7")
        "7" ##
      elsif board.taken?("3") && board.taken?("6") && board.valid_move?("9")
        "9"
      elsif board.taken?("4") && board.taken?("5") && board.valid_move?("6")
        "6"
      elsif board.taken?("4") && board.taken?("7") && board.valid_move?("1")
        "1"
      elsif board.taken?("5") && board.taken?("6") && board.valid_move?("4")
        "4"
      elsif board.taken?("5") && board.taken?("7") && board.valid_move?("3")
        "3"
      elsif board.taken?("5") && board.taken?("8") && board.valid_move?("2")
        "2"
      elsif board.taken?("6") && board.taken?("9") && board.valid_move?("3")
        "3"
      elsif board.taken?("7") && board.taken?("8") && board.valid_move?("9")
        "9"
      elsif board.taken?("8") && board.taken?("9") && board.valid_move?("7")
        "7"
      end # if checking all
    end # check_all


    def place_elsewhere(board)
      if board.valid_move?("1")
        "1"
      elsif board.valid_move?("3")
        "3"
      elsif board.valid_move?("7")
        "7"
      elsif board.valid_move?("9")
        "9"
      elsif board.valid_move?("6")
        "6"
      elsif board.valid_move?("4")
        "4"
      elsif board.valid_move?("8")
        "8"
      elsif board.valid_move?("2")
        "2"
      end # valid_move?

    end # place_elsewhere

  end # class Computer
end # module Players
