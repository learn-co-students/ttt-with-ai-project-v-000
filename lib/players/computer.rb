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
      @board = board
      move = nil

      Game::WIN_COMBINATIONS.detect do |combo|
        # checks first for possible wins, then possible blocks of the opponent
        if combo.select{|i| @board.cells[i+1] == @token}.size == 2 && combo.any?{|i| @board.cells[i+1] == " "}
          move = combo.select{|i| !@board.taken?(i+1)}.first.to_i.+(1).to_s

        elsif combo.select{|i| @board.cells[i+1] == @opponent_token}.size == 2 && combo.any?{|i| @board.cells[i+1] == " "}
          move = cmb.select{|i| !@board.taken?(i+1)}.first.to_i.+(1).to_s

        else
          move ||= [5, 1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
        end
      end
      move
    end
  end
end
