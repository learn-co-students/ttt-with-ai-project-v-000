module Players
  class Computer < Player

    def move(board)
    #first move - check if center cell avail & if yes take center
    if !board.taken?('5')
      '5'
      else
        best_move(board) + 1
      end
    end

    def best_move(board) #play your best option
      win(board) || block(board) || corner(board) || random
    end

    def corner(board) #check board corners
      [0,2,6,8].detect{|cell| !board.taken?(cell+1)}
    end

    def complete_combo?(board, token)
      #check all combinations
      Game::WIN_COMBINATIONS.detect do |combo|
      ((board.cells[combo[0]] == token && board.cells[combo[1]] == token) &&
        !board.taken?(combo[2]+1)) || ((board.cells[combo[1]] == token && board.cells[combo[2]] == token) &&
        !board.taken?(combo[0]+1)) || ((board.cells[combo[0]] == token && board.cells[combo[2]] == token) &&
        !board.taken?(combo[1]+1))
      end
    end

    def win(board)
    #check if winning combo for self possible & if yes make winning move
      winning_combo = complete_combo?(board, self.token)
      if winning_combo && winning_combo.count{|index| board.position(index+1) == self.token} == 2
        puts "...found winning combo #{winning_combo}"
        winning_combo.detect{|index| !board.taken?(index+1)}
      end
    end

    def block(board)
    #check if winning combo for opponent possible & if yes block
    blocking_combo = complete_combo?(board, self.opponent_token)
      if blocking_combo && blocking_combo.count{|index| board.position(index+1) == self.opponent_token} == 2
        puts "...found blocking combo #{blocking_combo}"
       blocking_combo.detect{|index| !board.taken?(index+1)}
     end
    end

    def opponent_token #know what opponent token is
      self.token == "X" ? "O" : "X"
    end

    def random #try any move avail
      (0..8).to_a.sample
    end
  end
end
