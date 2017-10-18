module Players
  class Computer < Player
    attr_accessor :name
    attr_reader :second_move

    WIN_COMBINATIONS = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [3, 5, 7],
      [1, 5, 9]
    ]

    def initialize(token)
      super
      @name = "Computer"
      @second_move = [1, 3, 7, 9]
    end

    def move(board)
      if board.turn_count == 0 || !board.taken?(5)
        "5"
      elsif board.turn_count == 1 || board.turn_count == 2
        second_move.sample.to_s
      else
        if self.token == "X"
          x_move(board)
        elsif self.token == "O"
          o_move(board)
        end
      end
    end

    def o_move(board)
      turn_3 = x_win(board) + board.o_positions
      if board.turn_count == 3 && board.taken?(turn_3.first)
        m = second_move - board.o_positions - board.x_positions
        m.sample.to_s
      elsif o_win(board).length == 1
        o_win(board).first.to_s
      elsif x_win(board).length == 1
        x_win(board).first.to_s
      else
        o = (1..9).to_a - board.o_positions - board.x_positions
        o.sample
      end
    end

    def x_move(board)
      if x_win(board).length == 1
        x_win(board).first.to_s
      elsif o_win(board).length == 1
        o_win(board).first.to_s
      else
        x = (1..9).to_a - board.x_positions - board.o_positions
        x.sample
      end
    end

    def x_win(board)
      x_win = WIN_COMBINATIONS.map do |a|
        w = a - board.x_positions
        a if w.length == 1
      end.compact.flatten - board.o_positions - board.x_positions
    end

    def o_win(board)
      o_win = WIN_COMBINATIONS.map do |a|
        w = a - board.o_positions
        a if w.length == 1
      end.compact.flatten - board.x_positions - board.o_positions
    end
  end
end
