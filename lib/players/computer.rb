module Players

  class Computer < Player
    def move(board)
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

      if board.empty? #IF BOARD IS EMPTY, TAKE POSITION 1
        "1"
      else # IF TTT IS ALMOST COMPLETE, COMPLETE ROW OR COL FOR WIN
        space = nil

        win_combos.each do |combo|

          if board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token
            space = combo[2]
          elsif board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token
            space = combo[0]
          elsif board.cells[combo[2]] == self.token && board.cells[combo[0]] == self.token
            space = combo[1]
          end
        end

        if space != nil
          "#{space}"
        else # REGULAR MOVES
          # if board.position(1) != self.token && !board.valid_move?(1)
          #   if [2,3,4,5,6,7,8,9].all? {|s| board.valid_move?(s)} #IF YOU DON'T CONTROL 1, PLAY FOR CENTER
          #     "#{5}"
          #   elsif [2,8].all? {|s| board.valid_move?(s)}
          #     "#{2}"
          #   elsif [4,6].all? {|s| board.valid_move?(s)}
          #     "#{4}"
          #   elsif [7,3].all? {|s| board.valid_move?(s)}
          #     "#{3}"
          #   else
          #     random = "#{rand(1..9)}"
          #     !board.valid_move?(random) ? move(board) : "#{random}"
          #   end
          # elsif board.position(1) == self.token #If YOU DO CONTROL 1, PLAY FOR CORNERS
          #   if [2,3].all? {|s| board.valid_move?(s)}
          #     "#{3}"
          #   elsif [4,7].all? {|s| board.valid_move?(s)}
          #     "#{7}"
          #   else
          #     random = "#{rand(1..9)}"
          #     !board.valid_move?(random) ? move(board) : "#{random}"
          #   end
          # elsif board.position(1) == self.token && [2,3].all {|s| board.valid_move?(s)}
          #
          # end

              random = "#{rand(1..9)}"
              !board.valid_move?(random) ? move(board) : "#{random}"
        end

      end #1st if end
    end #move method end
  end #class end
end #module end


# RANDOM MOVE, EASY MODE:
# random = "#{rand(1..9)}"
# !board.valid_move?(random) ? move(board) : "#{random}"
