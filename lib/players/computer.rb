module Players
  class Computer < Player

    def opponent_token
      self.token == "X" ? "O" : "X"
    end

    def move(board)
      # RANDOM MOVE, EASY MODE:
      # random = "#{rand(1..9)}"
      # !board.valid_move?(random) ? move(board) : "#{random}"

      # STRATEGIC PLAY, ADVANCED MODE:

      win_combos = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
      ]

      # TAKE 5 FIRST
      if board.valid_move?(5)
        return "5"
      # LOOK FOR TTTs TO COMPLETE & WIN
      elsif win_combos.any? {|combo| board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token && board.valid_move?(board.cells[combo[2]]) || board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token && board.valid_move?(board.cells[combo[0]]) || board.cells[combo[2]] == self.token && board.cells[combo[0]] == self.token && board.valid_move?(board.cells[combo[1]])}
        space = nil
        win_combos.each do |combo|
          if board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token
            space = "#{board.cells[combo[2]]}"
          elsif board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token
            space = "#{board.cells[combo[0]]}"
          elsif board.cells[combo[2]] == self.token && board.cells[combo[0]] == self.token
            space = "#{board.cells[combo[1]]}"
          end
        end
        return space
      # BLOCK OTHER PLAYER'S POSSIBLE TTTs
    elsif win_combos.any? {|combo| board.cells[combo[0]] == self.opponent_token && board.cells[combo[1]] == self.opponent_token && board.valid_move?(board.cells[combo[2]]) || board.cells[combo[1]] == self.opponent_token && board.cells[combo[2]] == self.opponent_token && board.valid_move?(board.cells[combo[0]]) || board.cells[combo[2]] == self.opponent_token && board.cells[combo[0]] == self.opponent_token && board.valid_move?(board.cells[combo[1]])}
        space = nil
        win_combos.each do |combo|
          if board.cells[combo[0]] == self.opponent_token && board.cells[combo[1]] == self.opponent_token
            space = "#{board.cells[combo[2]]}"
          elsif board.cells[combo[1]] == self.opponent_token && board.cells[combo[2]] == self.opponent_token
            space = "#{board.cells[combo[0]]}"
          elsif board.cells[combo[2]] == self.opponent_token && board.cells[combo[0]] == self.opponent_token
            space = "#{board.cells[combo[1]]}"
          end
        end
        return space
      # STRATEGIC MOVES IF YOU CONTROL 5
      elsif board.position(5) == self.token
        if board.valid_move?(6) && board.valid_move?(4)
          return "4"
        elsif board.position(6) == self.token && board.valid_move?(4)
          return "6"
        elsif board.valid_move?(2) && board.valid_move?(8)
          return "2"
        elsif board.position(2) == self.token && board.valid_move?(8)
          return "8"
        elsif board.valid_move?(3) && board.valid_move?(7)
          return "3"
        elsif board.position(3) == self.token && board.valid_move?(7)
          return "7"
        else
          random = "#{rand(1..9)}"
          return !board.valid_move?(random) ? move(board) : "#{random}"
        end
      # OTHERWISE TAKE 1
      elsif board.valid_move?(1)
        return "1"
      # STRATEGIC MOVES IF YOU CONTROL 1
      elsif board.position(1) == self.token
        if board.valid_move?(7) && board.valid_move?(4)
          return "7"
        elsif board.position(7) == self.token && board.valid_move?(4)
          return "4"
        elsif board.valid_move?(3) && board.valid_move?(2)
          return "3"
        elsif board.position(3) == self.token && board.valid_move?(2)
          return "2"
        else
          random = "#{rand(1..9)}"
          return !board.valid_move?(random) ? move(board) : "#{random}"
        end
      else
        random = "#{rand(1..9)}"
        !board.valid_move?(random) ? move(board) : "#{random}"
      end #end if line 21



    end #def move
  end #class Computer
end #module Players
