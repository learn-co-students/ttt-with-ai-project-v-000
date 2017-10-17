
module Players
  class Computer < Player

    def initialize(token)
      super
    end

    def move(board)
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = [1, 3, 7, 9].shuffle.find {|m| !board.taken?(m)}.to_s
      elsif board.turn_count  <= 3
        move = [1, 3, 7, 9].shuffle.find {|m| !board.taken?(m)}.to_s
      else
        Game::WIN_COMBINATIONS.find do |win_combination|
          if win_combination.select{|index|board.position(index+1) == self.token}.size == 2 && win_combination.one?{|index| !board.taken?(index+1)}
            move = win_combination.select{|index| !board.taken?(index+1)}.first
            move += 1
            move.to_s
          elsif win_combination.select{|index| board.taken?(index+1) && board.position(index+1) != self.token}.count == 2 && win_combination.one?{|index| !board.taken?(index+1)}
            # && win_combination.any?{|index|board.position(index+1) == " "}
            move = win_combination.select{|index| !board.taken?(index+1)}.first
            move += 1
            move.to_s
          end
        end
        move = [9, 7, 3, 1, 2, 4, 6, 8].find {|i| board.position(i) == " "} if move == nil
      end
      move
    end

  def other
    self.token.eql?("X") ? "O" : "X"
  end


  end  # End of Class
end  # End of Module



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
