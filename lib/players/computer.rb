
module Players
  class Computer < Player

    def initialize(token)
      super
    end

    def move(board)
      input = (rand * 10).floor
      board.valid_move?(input) ? input.to_s : move(board)
    end


    # def move(board)
    #   if board.turn_count > 4
    #     Game::WIN_COMBINATIONS.detect do |win_combination|  # returns array
    #       if win_combination.one?{|index|board.cells[index] != "X"}
    #         # binding.pry
    #         next_move(win_combination, board)
    #       elsif win_combination.one?{|index|board.cells[index] != "O"}
    #         # binding.pry
    #         next_move(win_combination, board)
    #       end
    #     end
    #   else
    #     input = (rand * 10).floor
    #     board.valid_move?(input) ? input.to_s : move(board)
    #   end
    # end
    #
    # def next_move(win_combo, board)
    #   # binding.pry
    #   win_combo.detect do |m|
    #     # binding.pry
    #     m += 1
    #     board.valid_move?(m)
    #     # binding.pry
    #
    #   end
    # end
    #
    # def index_to_input(index)
    #   index + 1
    # end


  end  # End of Class
end  # End of Module
