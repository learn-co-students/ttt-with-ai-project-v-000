class GameTree
  def generate
    initial_game_state = Board.new
    generate_moves(initial_game_state)
    initial_game_state
  end

  def generate_moves(board_state)
    board_state.cells.each_with_index do |current_cell, position|
      unless board_state.taken?(position)
        next_cells = board_state.cells.dup
        next_cells[position] = board_state.current_player

        next_board_state = Board.new(next_cells)
        board_state.moves << next_board_state
        generate_moves(next_board_state)
      end
    end
  end
end