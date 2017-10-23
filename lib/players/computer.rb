module Players
  class Computer < Player

    # def win?(board)
    #   Game::WIN_COMBINATIONS.detect do |combo|
    #     combo.select {|i| board.position(i+1) == token}.size == 2
    #     #   had the below line when the above was the first if statement within move method.
    #     #   move = combo.detect {|i| board.position(i) == " "}
    #     #   end
    #   end
    # end

    # Malki added this method today, and the program is in a loop. I can't see where the problem is, but it does not like the +1.

    def move(board)
      move = nil
      corner = [1, 3, 7, 9]
        # if win?(board)
        #   move = win?(board).detect{|i| board.cells[i] == " "} #  Malki added + 1 here, which raises an error, infinite loop without it.
        if board.valid_move?(5)
          move = "5"
        elsif board.valid_move?(1) || board.valid_move?(3) || board.valid_move?(7) || board.valid_move?(9)
          move = corner.detect {|i| board.valid_move?(i)}
        else
          move = rand(1..9).to_i
        end
      end
    end
  end

# issue is in trying to iterate over win combos. Will revisit to make it work.
# If I take out the win? method and just start with the first elsif statement, everything works, but AI is not using any strategy to win/block.
# need help with that part.
