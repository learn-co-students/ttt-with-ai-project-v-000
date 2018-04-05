module Players
  class Computer < Player

    attr_reader :token, :index, :name

    def initialize(token)
      @token = token
      @name = "Computer"
    end

    def move(board)
      available_moves = []
      board.cells.each_with_index do |cell, index|
        # binding.pry
        if cell == " "
          available_moves << (index + 1).to_s
          # binding.pry
        end
      end
      # binding.pry
      available_moves.sample
    end

  end

  # def best_possible (board, game.WIN_COMBINATIONS)
  #   best_moves = []
  #   WIN_COMBINATIONS.each do |combo|
  #     if board[combo[0]] == board[combo[1]] && board[combo[1]] != " "
  #       if board[combo[1]] == computer.token
  #         # make move
  #       else
  #         best_moves << board[combo[2]]
  #       end
  #     elsif if board[combo[0]] == board[combo[2]] && board[combo[2]] != " "
  #       if board[combo[2]] == computer.token
  #         # make move
  #       else
  #         best_moves << board[combo[1]]
  #       end
  #     elsif if board[combo[1]] == board[combo[1]] && board[combo[2]] != " "
  #       if board[combo[1]] == computer.token
  #         # make move
  #       else
  #         best_moves << board[combo[0]]
  #       end
  #     end
  #   end
  #   best_moves
  #   # use best_moves to make random choice from
  #   # if best_moves == [] us available moves
  # end

  # def best_possible (board, game.WIN_COMBINATIONS)
  #   best_moves = []
  #   WIN_COMBINATIONS.each do |combo|
  #       if cell == " "
  #         available_moves << (index + 1).to_s
  #       end
  #     end
  #     board.cells[available_moves.sample.to_i] = @token
  #     board.display
  #   end
  # end

end
