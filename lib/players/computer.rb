class Players
  class Computer < Player
    attr_accessor :board, :opponent_token, :valid_moves

    def initialize(token)
      super
      if @token == "X"
        @opponent_token = "O"
      else
        @opponent_token = "X"
      end
    end

    def move(board)
      move = nil

      Game::WIN_COMBINATIONS.detect do |combo|
        # checks first for possible wins, then possible blocks of the opponent
        if combo.select{|i| board.cells[i] == @token}.size == 2 && combo.any?{|i| board.cells[i] == " "}
          move = combo.detect{|i| board.cells[i] == " "}.to_i.+(1).to_s

        elsif combo.select{|i| board.cells[i] == @opponent_token}.size == 2 && combo.any?{|i| board.cells[i] == " "}
          move = combo.detect{|i| board.cells[i] == " "}.to_i.+(1).to_s
        end
      end
      move = [5, 1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move.nil?
      move
    end
  end
end
