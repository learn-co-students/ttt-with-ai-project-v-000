module Players
  class Computer < Player
    def move(board)
      if board.valid_move?('5')
        computer_move = '5'
      elsif board.valid_move?('1')
        computer_move = '1'
      elsif board.valid_move?('3')
        computer_move = '3'
      elsif board.valid_move?('7')
        computer_move = '7'
      elsif board.valid_move?('9')
        computer_move = '9'
      else
        ['2','4','6','8'].each { |n| computer_move = n if board.valid_move?(n) }
        computer_move
      end
    end
  end
end
