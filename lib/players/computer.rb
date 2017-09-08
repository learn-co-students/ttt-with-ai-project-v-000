
module Players
  class Computer < Player

    def initialize(token)
      super
    end

    # def move(board)
    #   input = (rand * 10).floor
    #   board.valid_move?(input) ? input.to_s : move(board)
    # end


    def move(board)
      Game::WIN_COMBINATIONS.detect do |win_combination|  # returns array
        binding.pry
        if win_combination.one?{|index|board.cells[index] != "X"}
          binding.pry
          next_move(win_combination)
        elsif win_combination.one?{|index|board.cells[index] != "O"}
          binding.pry
          next_move(win_combination)
        end
      end
      input = (rand * 10).floor
      board.valid_move?(input) ? input.to_s : move(board)
    end

    def next_move(win_combo)
      binding.pry
      win_combo.detect {|m| board.valid_move?(m)}
    end


  end  # End of Class
end  # End of Module
