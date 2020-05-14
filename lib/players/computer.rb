module Players
  class Computer < Player
    def initialize(token, first)
      super(token)
      if first
        d_token = token
      else
        d_token = token == 'X' ? 'O' : 'X'
      end
      data = {board: Array.new(9,' '), turn:d_token, score:nil }
      @tree = Tree.new(data, token)
      # binding.pry
    end

    def move(board)
        next_board = @tree.node_by_board[board.cells].children.max{|a,b| a.data[:score] <=> b.data[:score]}
        move_index = new_move(board.cells, next_board)
        move_index +1
        # binding.pry
    end

    def new_move(board, next_board)
      board.each.with_index do |el, i|
        return i if el != next_board.data[:board][i]
      end
    end

  end
end
