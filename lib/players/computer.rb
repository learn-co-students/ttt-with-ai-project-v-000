module Players
  class Computer < Player

    def move(board)
      computer_move = nil
      open_cells=[]

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
            open_cells << i
          end
        end
        computer_move = (open_cells.sample+1).to_s
      end
      computer_move
    end


    # def move(board)
    #   if !board.taken?(5)
    #     move = "5"
    #   elsif !board.taken?(1)
    #     move = "1"
    #   elsif !board.taken?(7)
    #     move = "7"
    #   elsif !board.taken?(9)
    #     move = "9"
    #   elsif !board.taken?(3)
    #     move = "3"
    #   elsif !board.taken?(2)
    #     move = "2"
    #   elsif !board.taken?(4)
    #     move = "4"
    #   elsif !board.taken?(6)
    #     move = "6"
    #   else
    #     move = "8"
    #   end
    #
    # end
  end
end
