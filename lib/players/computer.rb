module Players
  class Computer < Player
<<<<<<< HEAD

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

    def move(board)
      sleep(Random.rand((self.speed / 15)..(self.speed/7)))
      valid_moves = (1..9).to_a.select {|m| m if board.valid_move?(m) == true}
      side_moves = valid_moves.select {|m| m if m % 2 == 0}
      odd_moves = valid_moves.select {|m| m if m.to_i % 2 != 0}
=======
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

    def move(board)
      valid_moves = (1..9).to_a.select {|m| m if board.valid_move?(m) == true}
      side_moves = valid_moves.select {|m| m if m % 2 == 0}
      corner_moves = valid_moves.select {|m| m if m.to_i % 2 != 0 unless m == "5"}
>>>>>>> 65e572e4fecd54762fe1cf0dc9e4ab715dbcc7b1

      if valid_moves.include?(5)
        "5"
      elsif almost_won?(board)
        moves_arr = almost_won?(board).select do |ind|
          m = ind + 1
          if board.valid_move?(m)
            m
          end
        end
<<<<<<< HEAD
        (moves_arr.sample + 1).to_s
      elsif odd_moves.length > 0
        odd_moves.sample.to_s
      else
        side_moves.sample.to_s
=======
        moves_arr[0]
      elsif corner_moves.length > 0
        corner_moves[0].to_s
      else
        side_moves[0].to_s
>>>>>>> 65e572e4fecd54762fe1cf0dc9e4ab715dbcc7b1
      end

    end



    def two_row?(board)

      two_row = []

      WIN_COMBINATIONS.each do |comb|
<<<<<<< HEAD
=======
        # pass tests for "X" and "O" to #all?
>>>>>>> 65e572e4fecd54762fe1cf0dc9e4ab715dbcc7b1
        if (comb.select {|space| board.cells[space] == "X"}).length == 2 || (comb.select {|space| board.cells[space] == "O"}).length == 2
          two_row << comb
        end

      end
      two_row
    end

    def one_space?(board)
      res = []
      WIN_COMBINATIONS.each do |comb|
        if (comb.select {|space| board.cells[space] == " "}).length == 1
          res << comb
        end

      end
      res

    end

    def almost_won?(board)
      res = two_row?(board) & one_space?(board)
      if res.length == 0
        false
      else
        res[0]
      end
    end


  end
end
