module Players
  class Computer < Player
    attr_accessor :valid_moves

    def initialize(token)
      super
      @valid_moves = ('1'..'9').to_a
    end

    def move(board)
      valid_moves.sample
    end
  end
end
