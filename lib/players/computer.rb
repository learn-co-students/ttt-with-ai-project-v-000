require 'pry'

module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [2,4,6]]

    def move(board)
      if board.turn_count < 1
        (1..9).to_a.sample
      elsif can_win?(board)
        can_win?(board)
      elsif can_block?(board)
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
        (board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token && board.cells[combo[2]] == ' ') ||
        (board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token && board.cells[combo[0]] == ' ') ||
        (board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token && board.cells[combo[1]] == ' ')
      end

      if opportunity != nil
        index = opportunity.detect do |cell|
          board.cells[cell] == ' '
        end
        index + 1 #=> winning move
      else nil
      end
    end

    def can_block?(board)
      #**FIRST** check if any winning combination has two opponent's tokens, and
      #take the open cell in that combo
      threat = WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == self.opponent && board.cells[combo[1]] == self.opponent && board.cells[combo[2]] == ' ') ||
        (board.cells[combo[1]] == self.opponent && board.cells[combo[2]] == self.opponent && board.cells[combo[0]] == ' ') ||
        (board.cells[combo[0]] == self.opponent && board.cells[combo[2]] == self.opponent && board.cells[combo[1]] == ' ')
      end

      if threat
        index = threat.detect do |cell|
          board.cells[cell] == ' '
        end

        index + 1 #=> blocking move
      else nil
      end
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
