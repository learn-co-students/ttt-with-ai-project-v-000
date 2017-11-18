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
      if board.turn_count == 0
        ['1','2','3','4','6','7','8','9'].sample
      elsif board.turn_count == 1
        '5' if board.valid_move?('5')
      elsif can_win?(board)
        win(can_win?(board), board)
      elsif can_block?(board)
        block(can_block?(board), board)
      elsif prevent(board)
        prevent(board)
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
    end

    def win(win_move, board) #Pass in return value from #can_win?
      index = win_move.detect do |cell|
        board.cells[cell] == ' '
      end
      (index + 1).to_s #=> winning move
    end

    def can_block?(board)
      #**FIRST** check if any winning combination has two opponent's tokens, and
      #take the open cell in that combo
      threat = WIN_COMBINATIONS.detect do |combo|
        (board.cells[combo[0]] == self.opponent && board.cells[combo[1]] == self.opponent && board.cells[combo[2]] == ' ') ||
        (board.cells[combo[1]] == self.opponent && board.cells[combo[2]] == self.opponent && board.cells[combo[0]] == ' ') ||
        (board.cells[combo[0]] == self.opponent && board.cells[combo[2]] == self.opponent && board.cells[combo[1]] == ' ')
      end
    end


    def block(block_move, board) #pass in return value from can_block?
      index = block_move.detect do |cell|
        board.cells[cell] == ' '
      end
      (index + 1).to_s #=> blocking move
    end

    def prevent(board)
      case self.opponent
      when board.cells[1] && board.cells[3]
        '1' if board.valid_move?('1')
      when board.cells[1] && board.cells[5]
        '3' if board.valid_move?('3')
      when board.cells[3] && board.cells[7]
        '7' if board.valid_move?('7')
      when board.cells[5] && board.cells[7]
        '9' if board.valid_move?('9')
      when (board.cells[0] && board.cells[8]) || (board.cells[2] && board.cells[6])
        index = board.cells.map.with_index{|elem, index| index if (elem == ' ' && index.odd?)}.delete_if{|elem| elem == nil}.sample
        (index + 1).to_s
      when board.cells[2] && board.cells[6]
        index = board.cells.map.with_index{|elem, index| index if (elem == ' ' && index.odd?)}.delete_if{|elem| elem == nil}.sample
        (index + 1).to_s
      when board.cells[1] && board.cells[6]
        '1' if board.valid_move?('1')
      when board.cells[2] && board.cells[7]
        '9' if board.valid_move?('9')
      when board.cells[1] && board.cells[8]
        '3' if board.valid_move?('3')
      else
        false
      end

    #  if board.cells[1] == self.opponent && board.cells[3] == self.opponent
    #    return 1 if board.valid_move?(1)
    #  elsif board.cells[1]== self.opponent && board.cells[5] == self.opponent
    #    return 3 if board.valid_move?(3)
    #  elsif board.cells[3] == self.opponent && board.cells[7] == self.opponent
    #    return 7 if board.valid_move?(7)
    #  elsif board.cells[5] == self.opponent && board.cells[7] == self.opponent
    #    return 9 if board.valid_move?(9)
    #  elsif board.cells[0] == self.opponent && board.cells[8] == self.opponent
    #    if board.valid_move?(8)
    #      return 8
    #    else return 2
    #    end
    #  elsif board.cells[2] == self.opponent && board.cells[6] == self.opponent
    #    if board.valid_move?(8)
    #      return 8
    #    else return 2
    #    end
    #  else
    #    false
    #  end
    end

    def opponent
      self.token == 'X' ? 'O' : 'X'
    end
  end
end
