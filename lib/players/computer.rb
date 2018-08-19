module Players
  class Computer < Player
    attr_accessor :game
    def initialize(game)
      super
      @game = game
    end

    def move
      if @game.board.valid_move?(5)
        return 5
      end
      @game.WIN_COMBINATIONS.each 
    end
  end
end
