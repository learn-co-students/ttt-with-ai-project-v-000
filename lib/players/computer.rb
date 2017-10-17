module Players
  class Computer < Player
    attr_accessor :valid_moves

    def initialize(token)
      super
      @valid_moves = ('1'..'9').to_a
    end

    def move(board)
      result = case
      when !board.taken?(5) then "5"
      when !board.taken?(3) then "3"
      when !board.taken?(6) then "6"
      when !board.taken?(9) then "9"
      when board.turn_count == 1 then "1"
      else valid_moves.sample
      end

      board.valid_move?(result) ? result : move(board)
    end
  end
end
