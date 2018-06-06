require 'pry'
module Players
  class Computer < Player
    def move(board)
      turn = board.turn_count
      
      case turn
      when 0
        if !board.taken?(7)
          '7' 
        end
      when 1 
        if !board.taken?(5)
          '5'
        elsif !board.taken?(7)
          '7'
        elsif !board.taken?(1)
          '1'
        elsif !board.taken?(3)
          '3'
        elsif !board.taken?(9)
          '9'
        elsif !board.taken?(2)
          '2'
        elsif !board.taken?(4)
          '4'
        elsif !board.taken?(6)
          '2'
        elsif !board.taken?(8)
          '2'
        end
      when 2 
        if board.position(5) != 'O'
          if board.position(4) == 'O'
            '9'
          elsif board.position(8) == 'O'
            '1'
          end
        elsif !board.taken?(9)
          '9'
        elsif !board.taken?(1)
          '1'
        elsif !board.taken?(3)
          '3'
        end
      when 3
        if board.position(1) == 'X' && board.position(2) == 'X'
          '3'
        elsif board.position(1) == 'X' && board.position(4) == 'X'
          '7'
        elsif board.position(1) == 'X' && board.position(5) == 'X'
          '9'
        elsif board.position(2) == 'X' && board.position(3) == 'X'
          '1'
        elsif board.position(2) == 'X' && board.position(4) == 'X'
          '8'
        elsif board.position(3) == 'X' && board.position(6) == 'X'
          '9'
        elsif board.position(3) == 'X' && board.position(5) == 'X'
          '7'
        elsif board.position(4) == 'X' && board.position(5) == 'X'
          '6'
        elsif board.position(4) == 'X' && board.position(7) == 'X'
          '1'
        elsif board.position(5) == 'X' && board.position(6) == 'X'
          '4'
        elsif board.position(5) == 'X' && board.position(7) == 'X'
          '3'
        elsif board.position(5) == 'X' && board.position(8) == 'X'
          '2'
        elsif board.position(5) == 'X' && board.position(9) == 'X'
          '1'
        elsif board.position(6) == 'X' && board.position(9) == 'X'
          '3'
        elsif board.position(7) == 'X' && board.position(8) == 'X'
          '9'
        elsif board.position(8) == 'X' && board.position(9) == 'X'
          '7'
        elsif board.position(1) == 'X' && board.position(3) == 'X'
          '2'
        elsif board.position(1) == 'X' && board.position(7) == 'X'
          '4'
        elsif board.position(1) == 'X' && board.position(9) == 'X'
          '5'
        elsif board.position(7) == 'X' && board.position(9) == 'X'
          '8'
        elsif board.position(3) == 'X' && board.position(9) == 'X'
          '6'
        elsif board.position(3) == 'X' && board.position(7) == 'X'
          '5'
        elsif board.position(2) == 'X' && board.position(4) == 'X'
          '1'
        elsif board.position(2) == 'X' && board.position(6) == 'X'
          '3'
        elsif board.position(4) == 'X' && board.position(8) == 'X'
          '7'
        elsif board.position(6) == 'X' && board.position(8) == 'X'
          '9'
        elsif !board.taken?(1)
          '1'
        elsif !board.taken?(2)
          '2'
        elsif !board.taken?(3)
          '3'
        elsif !board.taken?(4)
          '4'
        elsif !board.taken?(5)
          '5'
        elsif !board.taken?(6)
          '6'
        elsif !board.taken?(7)
          '7'
        elsif !board.taken?(8)
          '8'
        elsif !board.taken?(9)
          '9'
        end 
      when 4
        if board.position(2) == 'O' && board.position(5) == 'O'
          '8'
        elsif board.position(4) == 'O' && board.position(5) == 'O'
          '6'
        elsif board.position(8) == 'O' && board.position(5) == 'O'
          '2'
        elsif board.position(6) == 'O' && board.position(5) == 'O'
          '4'
        elsif board.position(3) == 'X' && board.position(7) == 'X'
          '5'
        elsif !board.taken?(1)
          '1'
        elsif !board.taken?(2)
          '2'
        elsif !board.taken?(3)
          '3'
        elsif !board.taken?(4)
          '4'
        elsif !board.taken?(5)
          '5'
        elsif !board.taken?(6)
          '6'
        elsif !board.taken?(7)
          '7'
        elsif !board.taken?(8)
          '8'
        elsif !board.taken?(9)
          '9'
        end
      when 5
        if !board.taken?(1)
          '1'
        elsif !board.taken?(2)
          '2'
        elsif !board.taken?(3)
          '3'
        elsif !board.taken?(4)
          '4'
        elsif !board.taken?(5)
          '5'
        elsif !board.taken?(6)
          '6'
        elsif !board.taken?(7)
          '7'
        elsif !board.taken?(8)
          '8'
        elsif !board.taken?(9)
          '9'
        end
      when 6
        if board.position(4) == 'O' && board.position(5) == 'O'
          '6'
        elsif board.position(6) == 'O' && board.position(5) == 'O'
          '4'
        elsif board.position(3) == 'X' && board.position(9) == 'X'
          '6'
        elsif board.position(3) == 'X' && board.position(7) == 'X'
          '5'
        elsif !board.taken?(1)
         '1'
        elsif !board.taken?(2)
         '2'
        elsif !board.taken?(3)
         '3'
        elsif !board.taken?(4)
         '4'
        elsif !board.taken?(5)
         '5'
        elsif !board.taken?(6)
         '6'
        elsif !board.taken?(7)
         '7'
        elsif !board.taken?(8)
         '8'
        elsif !board.taken?(9)
         '9'
        end
      when 7
        if board.position(1) == 'X' && board.position(2) == 'X' && !board.taken?(3)
          '3'
        elsif board.position(1) == 'X' && board.position(4) == 'X' && !board.taken?(7)
          '7'
        elsif board.position(1) == 'X' && board.position(5) == 'X' && !board.taken?(9)
          '9'
        elsif board.position(1) == 'X' && board.position(3) == 'X' && !board.taken?(2)
          '2'
        elsif board.position(1) == 'X' && board.position(7) == 'X' && !board.taken?(4)
          '4'
        elsif board.position(1) == 'X' && board.position(9) == 'X' && !board.taken?(5)
          '5'
        elsif board.position(2) == 'X' && board.position(3) == 'X' && !board.taken?(1)
          '1'
        elsif board.position(2) == 'X' && board.position(4) == 'X' && !board.taken?(8)
          '8'
        elsif board.position(3) == 'X' && board.position(6) == 'X' && !board.taken?(9)
          '9'
        elsif board.position(3) == 'X' && board.position(5) == 'X' && !board.taken?(7) 
          '7'
        elsif board.position(3) == 'X' && board.position(9) == 'X' && !board.taken?(6)
          '6'
        elsif board.position(3) == 'X' && board.position(7) == 'X' && !board.taken?(5)
          '5'
        elsif board.position(4) == 'X' && board.position(5) == 'X' && !board.taken?(6)
          '6'
        elsif board.position(4) == 'X' && board.position(7) == 'X' && !board.taken?(1)
          '1'
        elsif board.position(5) == 'X' && board.position(6) == 'X' && !board.taken?(4)
          '4'
        elsif board.position(5) == 'X' && board.position(7) == 'X' && !board.taken?(3)
          '3'
        elsif board.position(5) == 'X' && board.position(8) == 'X' && !board.taken?(2)
          '2'
        elsif board.position(5) == 'X' && board.position(9) == 'X' && !board.taken?(1)
          '1'
        elsif board.position(6) == 'X' && board.position(9) == 'X' && !board.taken?(3)
          '3'
        elsif board.position(7) == 'X' && board.position(8) == 'X' && !board.taken?(9)
          '9'
        elsif board.position(8) == 'X' && board.position(9) == 'X' && !board.taken?(7)
          '7'
        elsif !board.taken?(1)
         '1'
        elsif !board.taken?(2)
         '2'
        elsif !board.taken?(3)
         '3'
        elsif !board.taken?(4)
         '4'
        elsif !board.taken?(5)
         '5'
        elsif !board.taken?(6)
         '6'
        elsif !board.taken?(7)
         '7'
        elsif !board.taken?(8)
         '8'
        elsif !board.taken?(9)
         '9'
        end
      when 8
        if !board.taken?(1)
          '1'
        elsif !board.taken?(2)
          '2'
        elsif !board.taken?(3)
          '3'
        elsif !board.taken?(4)
          '4'
        elsif !board.taken?(5)
          '5'
        elsif !board.taken?(6)
          '6'
        elsif !board.taken?(7)
          '7'
        elsif !board.taken?(8)
          '8'
        elsif !board.taken?(9)
          '9'
        end
      end
    end
  end
end
  