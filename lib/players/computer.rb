require 'require_all'

class Computer < Player

  def move(board)

    ############ Code for going first ##################

    # TURN ONE: takes the top left corner
    if Game.turn_count == 0
      "1"
    # TURN THREE: takes the bottom right corner, or the top right corner.
    elsif Game.turn_count == 2
      if Game.position_taken?(8)
        "3"
      else
      "8"
      end
    #TURN FIVE: Checks to see if it can win, otherwise makes another move.
    elsif Game.turn_count == 4
     combo_check
     corner_check
     any_move
    else
      combo_check
      corner_check
      any_move
    end

  end





  #Checks to see if computer can win game, or if opponent is in position to win the game, and acts accordingly.
  def combo_check

  Game.WIN_COMBINATIONS.each do |combo|
    if position(combo[0] + 1) == position(combo[1] + 1)
      spot = position(combo[2] + 1) + 1
      return spot.to_s
    elsif position(combo[1] + 1) == position(combo[2] + 1)
      spot = position(combo[0] + 1) + 1
      return spot.to_s
    elsif position(combo[0] + 1) == position(combo[2] + 1)
      spot = position(combo[1] + 1) + 1
      return spot.to_s
    end
  end
end



    #checks if a corner is open if a combo isnt available
    def corner_check
      # i increments and taken states if the spot is occupied
      i = 0
      taken = true

      # this checks each corner and increments to accomodate for the strange spacing.
      # x will be set to i before the check, and will be set to 9 if all spots are occupioed.
      until taken == false || x == 9
        x = i
        taken = Game.position_taken(i)
        i += 2
        x = i
        taken = Game.position_taken(i)
        i += 4
        x = i
        taken = Game.position_taken(i)
        i += 2
        x = i
        taken = Game.position_taken(i)
        x = 9
      end
      # if no corners are available nil will be returned,
      # otherwise the space will be returned as a string
      if taken == true
        nil
      else
        x.to_s
      end

    end


    def any_move
      i = 0
      taken = true
      until taken == false
        x = i
        taken = Game.position_taken?(i)
        i += 1
      end
      x.to_s
    end

  end
