module Players
  class Computer < Player

    def move(board)
      computer_move = nil
      open_moves=[]

      if !board.taken?(5)
        computer_move = "5"
      elsif !board.taken?(7)
        computer_move = "7"
      elsif !board.taken?(1)
        computer_move = "1"
      elsif !board.taken?(9)
        computer_move = "9"
      else
        board.cells.each_with_index do |cell, i|
          if cell == " "
            open_moves << i
          end
        end
        computer_move = (open_moves.sample+1).to_s
      end
      sleep(1)
      computer_move
    end

  end
end
