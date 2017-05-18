module Players
  class Computer < Player
    attr_accessor :move

    def move(board)
      # binding.pry
      empty_cells = board.cells.collect {|i| i=="" || i==" "}
      number_of_moves_left = empty_cells.count
      move_made = rand(0..number_of_moves_left-1).to_s

      # binding.pry

    end

  end

end
