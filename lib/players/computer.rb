module Players
  class Computer < Player
    def move(board)
      # Lame AI, but at least I got it to work!
      # Plus, its sporadic and unpredicatable. ;))
      # Will come back later to implement more!

      if board.cells[4] == " "
        computer_move = "5"
      else
        computer_move = rand(1..9).to_s

        until board.valid_move?(computer_move)
          computer_move = rand(1..9).to_s
        end
      end

      computer_move
    end
  end
end
