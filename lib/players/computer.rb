module Players

  class Computer < Player

    attr_reader :game_tree
    def initialize(token)
      super(token)
      first = token == "X"
      t = TicTacToeTree.new(first: first)
      @game_tree = t
    end

    def move(board)
      sleep(1)
      ai_board = translate_board(board)
      move = self.game_tree.get_minimax_move(ai_board)
      if move.nil?
        move = self.game_tree.available_moves(translate_board(board))[0]
      end
      (move + 1).to_s
    end

    def translate_board(board)
      t_board = board.cells.map do |cell|
        case cell
        when self.token
          1
        when " "
          nil
        else
          0
        end
      end
      t_board
    end


  end

end
