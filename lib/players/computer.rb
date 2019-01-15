 module Players
#
   class Computer < Player

     WIN_COMBINATIONS = [
       [0,1,2],
       [3,4,5],
       [6,7,8],
       [0,3,6],
       [1,4,7],
       [2,5,8],
       [0,4,8],
       [2,4,6]
     ]

    def move(board)
      sleep(0.5)
      moves = get_moves(board)
      if corner_move(board)
        move = corner_move(board)
      else
        move = moves.sample
      end
      move = move + 1
      move.to_s
    end

    def get_moves(board)
      moves = board.cells.map.with_index{|x, i| i if x == " "}
      moves = moves.select {|m| m != nil}
    end

    def corner_move(board)
      corners = [0,2,6,8]
      moves = get_moves(board)
      corners.find{|c| moves.include?(c)}
    end

    def part_won?(board)
      WIN_COMBINATIONS.collect do |wc|
      if board.cells[wc[0]] == @token ||
         board.cells[wc[1]] == @token ||
         board.cells[wc[2]] == @token
         wc.uniq
      elsif board.cells[wc[0]] == @token ||
            board.cells[wc[1]] == @token ||
            board.cells[wc[2]] == @token
         wc.uniq
      else
        false
      end
      end
    end

  end
 end
