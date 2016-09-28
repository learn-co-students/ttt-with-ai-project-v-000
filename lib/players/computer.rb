require 'pry'
module Players

  class Computer < Player

    def old_move(board)  #old move method; change name back to move to use
      if board.valid_move?(1)
        "1"
      elsif board.valid_move?(5)
        "5"
      elsif board.valid_move?(3)
        "3"
      elsif board.valid_move?(2)
        "2"
      elsif board.valid_move?(8)
        "8"
      elsif board.valid_move?(4)
        "4"
      elsif board.valid_move?(6)
        "6"
      elsif board.valid_move?(9)
        "9"
      else
        "7"
      end
    end

    def move(board)
      move = nil  #placeholder that will return the computer's move as a string

      if board.turn_count.even? && board.turn_count < 4
        move = ["1", "3", "5"].detect {|pick| board.valid_move?(pick)}
      elsif board.turn_count.odd? && board.turn_count < 5
        move = ["5", "1", "3", "7", "9"].detect {|pick| board.valid_move?(pick)}
      else
        move = ["2", "4", "6", "7", "8", "9"].sample
      end
      #binding.pry
    end

  end #class end

end #module end
