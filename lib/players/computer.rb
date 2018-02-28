require_relative '../player.rb'

module Players

  class Computer < Player
    def create_shadow_board(board)
      shadow_board = Board.new
      shadow_cells = []
      board.cells.each {|cell| shadow_cells << cell}
      shadow_board.cells = shadow_cells
      shadow_board
    end

    def create_shadow_game(board)
      shadow_board = create_shadow_board(board)
      if board.turn_count % 2 == 0 ? "shadow_player_1" : "shadow_player_2" == "shadow_player_1"
        shadow_player_1 = self
        shadow_player_2 = Players::Computer.new("O")
      else
        shadow_player_1 = Players::Computer.new("X")
        shadow_player_2 = self
      end
      Game.new(shadow_player_1, shadow_player_2, shadow_board)
    end

    def identify_best_move(board)
      best_move = (board.cells.find_index {|cell| cell == " "} + 1).to_s
      possible_moves = []
      board.cells.each.with_index {|cell, index| possible_moves << (index+1).to_s if cell == " "}
      possible_moves.each {|move|
        shadow_game = create_shadow_game(board)
        shadow_game.board.update(move, self)
        best_move = move if shadow_game.over? != false
      }
      best_move
    end

    def move(board)
      identify_best_move(board)
    end

  end

end

#identify_best_move(board)
