require 'require_all'
require 'pry'

module Players
class Computer < Player

  WIN_COMBINATIONS = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [3, 5, 7]
    ]

    CORNERS = [1, 3, 7, 9]

    OTHERS = [2, 4, 5, 6, 8]

  def move(board)

    ############ Code for going first ##################

    # TURN ONE: takes the top left corner


    if board.turn_count == 0
      "1"

    # TURN THREE: takes the bottom right corner, or the top right corner.

    elsif board.turn_count == 2
      if board.taken?(9)
        "3"
      else
      "9"
      end

    #TURN FIVE: Checks to see if it can win, otherwise makes another move.

    else
      # if !(combo_check(board) == nil)
      #   combo_check(board)
      # if !(corner_check(board) == nil)
      #   corner_check(board)
      # else
      any_move(board)
      # end
    end

  end


  #Checks to see if computer can win game, or if opponent is in position to win the game, and acts accordingly.
  def combo_check(board)
    spot = nil
  WIN_COMBINATIONS.each do |combo|
    if board.position(combo[0]) == board.position(combo[1]) && board.position(combo[0]) != " "
      spot = combo[2]
    elsif board.position(combo[1]) == board.position(combo[2]) && board.position(combo[1]) != " "
      spot = combo[0]
    elsif board.position(combo[0]) == board.position(combo[2]) && board.position(combo[0]) != " "
      spot = combo[1]
    end
  end
  return spot
end



    #checks if a corner is open if a combo isnt available
    def corner_check(board)
      # i increments and taken states if the spot is occupied
      i = 1
      taken = true

      # this checks each corner and increments to accomodate for the strange spacing.
      # x will be set to i before the check, and will be set to 10 if all spots are occupioed.
      x = 1
      until taken == false
        x = i
        taken = board.taken?(i)
        i += 2
        x = i
        taken = board.taken?(i)
        i += 4
        x = i
        taken = board.taken?(i)
        i += 2
        x = i
        taken = board.taken?(i)
      end
      # if no corners are available nil will be returned,
      # otherwise the space will be returned as a string
      if taken == true
        nil
      else
        x.to_s
      end

    end


    def any_move(board)
      i = 1
      taken = true
      x = i
      until taken == false || x == 10
        x = i
        taken = board.taken?(i)
        i += 1
      end
      x.to_s
    end

  end
end
