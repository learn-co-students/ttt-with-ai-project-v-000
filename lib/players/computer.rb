require 'require_all'
require 'pry'

module Players
class Computer < Player

  WIN_COMBINATIONS_2 = [
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

    # TURN TWO (GOIN SECOND)
  elsif board.turn_count == 1
      if (CORNERS.any? {|corner|  board.taken?(corner)})
        filled_corner = CORNERS.find {|corner| board.taken?(corner)}

        case filled_corner
        when 1
          return "2"
        when 3
          return "2"
        else
          return "8"
        end
      else
        corner_check(board)
      end

    # TURN THREE: takes the bottom right corner, or the top right corner.
    elsif board.turn_count == 2
      if !board.taken?(9)
        "9"
      elsif !board.taken?(3)
        "3"
      else
        any_move(board)
      end
    #Turn Four: Checks for combos, otherwise takes the central square.
    elsif board.turn_count == 3

      if combo_check(board) != nil
        combo_check(board)
      elsif !board.taken?(5)
          "5"
      elsif (corner_check(board) != nil)
        corner_check(board)
      else
        any_move(board)
      end
    #TURN FIVE: Checks to see if it can win, otherwise makes another move.

    else
      if combo_check(board) != nil
        combo_check(board)
      elsif (corner_check(board) != nil)
        corner_check(board)
      else
        any_move(board)
      end
    end

  end


  #Checks to see if computer can win game, or if opponent is in position to win the game, and acts accordingly.
  def combo_check(board)
    WIN_COMBINATIONS_2.each do |combo|
      if board.taken?(combo[0]) && board.position(combo[0]) == board.position(combo[1]) && !board.taken?(combo[2])
        return combo[2].to_s
      elsif board.taken?(combo[1]) && board.position(combo[1]) == board.position(combo[2]) && !board.taken?(combo[0])
        return combo[0].to_s
      elsif board.taken?(combo[2]) && board.position(combo[0]) == board.position(combo[2]) && !board.taken?(combo[1])
        return combo[1].to_s
      end
    end
    nil
  end



    #checks if a corner is open if a combo isnt available
    def corner_check(board)
      CORNERS.each do |corner|
        if !board.taken?(corner)
          return corner.to_s
        end
      end
      nil
    end


    def any_move(board)
      OTHERS.each do |other|
        if !board.taken?(other)
          return other.to_s
        end
      end
      nil
    end

  end
end
