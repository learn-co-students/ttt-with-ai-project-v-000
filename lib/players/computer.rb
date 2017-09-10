module Players
  class Computer < Player

    def move(board)

      win_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

      other_token = nil
      self.token == "X" ? other_token = "O" : other_token = "X"

      if board.turn_count <= 2
        if !board.taken?(5)
          move = 5
        else
          move = [1,3,7,9].select {|cell| !board.taken?(cell)}.sample
        end
      end

      if board.turn_count > 2
        to_win = win_combinations.detect do |combo|
          [board.position(combo[0]), board.position(combo[1]), board.position(combo[2])].sort == [self.token, self.token, " "].sort
        end
        to_block = win_combinations.detect do |combo|
          [board.position(combo[0]), board.position(combo[1]), board.position(combo[2])].sort == [other_token, other_token, " "].sort
        end
        if !to_win && to_block
          move = to_block.detect {|cell| !board.taken?(cell)}
        elsif to_win
          move = to_win.detect {|cell| !board.taken?(cell)}
        else
          next_move = win_combinations.detect do |combo|
            [board.position(combo[0]), board.position(combo[1]), board.position(combo[2])].sort == [self.token, " ", " "].sort
          end
          if next_move
            next_move[2] == self.token ? move = next_move[1] : move = next_move.detect {|cell| !board.taken?(cell)}
          else
            move = (1..9).to_a.select {|cell| !board.taken?(cell)}.sample
          end
        end
      end

      puts "Player #{self.token}'s move: #{move}"
      move.to_s
    end

  end
end
