require_relative '../player.rb'

module Players

  class Computer < Player
    def move(board)
      best_move(board)
    end

    def best_move(board)
      return_move = default_move(board)
      return_move = block_move(board) if block_move(board) != nil
      return_move = over_move(board) if over_move(board) != nil
      return_move
    end

    def default_move(board)
      return_move = (board.cells.find_index {|cell| cell == " "} + 1).to_s
      return_move
    end

    def block_move(board)
      return_move = nil
      possible_moves(board).each {|move|
        shadow_game = create_shadow_game(board)
        shadow_game.player_1 == self ? player = shadow_game.player_2 : player = shadow_game.player_1
        shadow_game.board.update(move, player)
        return_move = move if shadow_game.over?
      }
      return_move
    end

    def over_move(board)
      return_move = nil
      possible_moves(board).each {|move|
        shadow_game = create_shadow_game(board)
        shadow_game.board.update(move, self)
        return_move = move if shadow_game.over?
      }
      return_move
    end

    def possible_moves(board)
      return_moves = []
      board.cells.each.with_index {|cell, index|
        return_moves << (index+1).to_s if cell == " "
      }
      return_moves
    end

    def create_shadow_game(board)
      token == "X" ? shadow_player_1 = self : shadow_player_2 = self
      shadow_player_1 == self ? shadow_player_2 = Players::Computer.new("O") : shadow_player_1 = Players::Computer.new("X")
      shadow_board = create_shadow_board(board)
      Game.new(shadow_player_1, shadow_player_2, shadow_board)
    end

    def create_shadow_board(board)
      shadow_cells = []
      board.cells.each {|cell| shadow_cells << cell}
      shadow_board = Board.new
      shadow_board.cells = shadow_cells
      shadow_board
    end

  end

end

#identify_best_move(board)
