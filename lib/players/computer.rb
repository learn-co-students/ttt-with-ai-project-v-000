
module Players
  class Computer < Player

    def initialize(token)
      super
    end

    def move(board)
      input = (rand * 10).floor
      board.valid_move?(input) ? input.to_s : move(board)
    end

    if !board.taken?(5)
      move = "5"

    elsif board.taken(5) && turn_count < 5
      move = ["1", "3", "7", "9"].find {|m| board.position(m) == " "}
    else
      Game::WIN_COMBINATIONS.find do |win_combination|
        if win_combination.select{|index|board.cells[index] == self.token}.count == 2 &&
          win_combination.one?{|index|board.cells[index] == " "}
          move = win_combination.find{|index|board.cells[index] == " "}
          (move += 1).to_s
        else
          win_combination.select{|index|board.cells[index] == other}.count == 2 &&
            win_combination.one?{|index|board.cells[index] == " "}
            move = win_combination.find{|index|board.cells[index] == " "}
            (move += 1).to_s
          end
        end
      end
      move = (0..8).find {|i| board.position(i)}




    def other
      self.token.eql?("X") ? "O" : "X"
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
