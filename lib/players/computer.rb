module Players
  class Computer < Player
    def move(board)
      if valid_move(can_win?(board))
        can_win?(board)
      elsif valid_move(can_block?(board))
        can_block?(board)
      elsif board.valid_move?('5')
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

    def can_win?(board)
      #**FIRST** check if any winning combination has two of self's tokens
      #and if the leftover spot is open take it
      opportunity = WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token) ||
        (board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token) ||
        (board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token)
      end

      opportunity.index(' ') + 1
    end

    def can_block?(board)
      #**FIRST** check if any winning combination has two opponent's tokens, and
      #take the open cell in that combo

      #corners = [1,3,7,9]
      #middles = [2,4,6,8]
      # if two opposing corners are taken by opponent move to middle
      # if two opposing middles are taken by opponent move to middle
    end

    def opponent
      self.token == 'X' ? 'O' : 'X'
    end
  end
end
