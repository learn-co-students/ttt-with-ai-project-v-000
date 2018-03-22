require 'pry'

module Players
  class Computer < Player
    attr_accessor :input, :corner

    # method to find free corner spaces
    def free_corner(board)
      @corner = []
      corner_cells = [1,3,7,9]

      board.cells.each_with_index do |token, idx|
        if corner_cells.include?(idx + 1 )
          corner << idx + 1 if !board.taken?(idx + 1)
        else
          next
        end
      end
      corner
    end

    def move(board)
      # if board.turn_count == 0
      #  i = rand(0..3)
      #  corner_cells = [1,3,7,9]
      #  @input = corner_cells[i].to_s
      # # else
      # #  @input = rand(1..9).to_s
      # end
      #
      # if free_corner(board).length >= 1
      #   i = rand(0..corner.length)
      #   corner_cells = [1,3,7,9]
      #   @input = corner_cells[i].to_s
      # else
      #   @input = rand(1..9).to_s
      # end

      if board.turn_count == 0
       i = rand(0..3)
       corner_cells = [1,3,7,9]
       @input = corner_cells[i].to_s

      elsif free_corner(board).length >= 1
        corner_cells = free_corner(board)
          i = rand(0..corner.length)
          @input = corner_cells[i].to_s
      elsif free_corner(board) == []
          i = rand(0..5)
          side_cells = [2,4,5,6,8]
          @input = side_cells[i].to_s
      end

      # binding.pry
      input
    end

  end

end
