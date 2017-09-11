
module Players
  class Computer < Player

    def initialize(token)
      super
    end

    def move(board)
      if board.turn_count <= 4
        binding.pry
        random_move(board)
      else
        find_index(to_win(board), board)
      end
    end

    def to_win(board)
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.count{|e| board.position(e) == self.token}.eql?(2) && combo.count{|e| board.position(e) == " "}.eql?(1)
          binding.pry
            combo
        elsif combo.count{|e| board.position(e) == other}.eql?(2) && combo.count{|e| board.position(e) == " "}.eql?(1)
            binding.pry
            combo
        else
          random_move(board)
        end
      end
    end

    def find_index(array, board)
      array.find{|e| board.valid_move?(e+1)}
    end

    def other
      self.token.eql?("X") ? "O" : "X"
    end

    def random_move(board)
      input = (rand * 10).floor
      board.valid_move?(input) ? input.to_s : move(board)
    end



  end  # End of Class
end  # End of Module

  # def offense(board)
  #   if combo.count{|e| board.position(e) == "X"}.eql?(2) && combo.count{|e| board.position(e) == " "}.eql?(1)
  #     combo
