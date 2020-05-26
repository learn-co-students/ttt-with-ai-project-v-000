module Players

  class Computer < Player
    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def move(board)
      move = nil

      #first move, middle spot, if first taken
      if !board.taken?(5)
        move = "5"
      #first move, top spot, if available
      elsif board.turn_count == 1
        move = "1"
      #next move, corner spot
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect do |input|
          !board.taken?(input).to_s
        end

      else
        #basically picking any good spot
      Game::WIN_COMBINATIONS.detect do |combo|
         if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
           move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
         end
       end

      end

    end
  end

end
