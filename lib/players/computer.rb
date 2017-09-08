
module Players
  class Computer < Player

    def initialize(token)
      super
    end

    def move(board)
      input = (rand * 10).floor
      board.valid_move?(input) ? input.to_s : move(board)
    end


    def defense(board)
      WIN_COMBINATIONS.sort.detect do |win_combination|
        binding.pry
        if win_combination.one?{|index|board[index] != "X"}
          binding.pry
          win_combination
        elsif win_combination.one?{|index|board[index] == "O"}
          binding.pry
          win_combination
        else
         move(board)
        end
      end
    end


  end  # End of Class
end  # End of Module
