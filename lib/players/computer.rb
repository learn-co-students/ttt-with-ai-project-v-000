module Players
  class Computer < Player

    def move(board)
      remaining_combo = []

      # get players' positions
      other_token = (self.token == "X") ? "O" : "X"
      other_positions = board.cells.map.with_index{|x, i| i if x == other_token}.compact
      my_position = board.cells.map.with_index{|x, i| i if x == self.token}.compact

      # statistically more combination possible
      return "5" if board.turn_count == 0

      Game::WIN_COMBINATIONS.each do |combo|
        # look for win
        my_intersection = combo & my_position
        my_position_remaining = combo - my_intersection
        return (my_position_remaining.first.to_i + 1) if my_position_remaining.size == 1 && board.cells[my_position_remaining.first] == " "
      end

      # block other player if 1 move left from win
      Game::WIN_COMBINATIONS.each do |combo|
        # block
        intersection = combo & other_positions
        position_remaining = combo - intersection
        remaining_combo << combo if position_remaining.size == 3
        return (position_remaining.first.to_i + 1) if position_remaining.size == 1 && board.cells[position_remaining.first] == " "
      end

      # possible win : intersect remaining combo and current position on the field
      remaining_combo.each do |combo|
        my_intersection = combo & my_position
        my_position_remaining = combo - my_intersection
        return (my_position_remaining.first.to_i + 1) if my_position_remaining.size == 2 && board.cells[my_position_remaining.first] == " "
      end

      # play anywhere, to start any combo
      return remaining_combo[0].first if remaining_combo.size > 0

      # choose an empty position randomly
      return board.cells.map.with_index{|x, i| i if x == " "}.compact.sample.to_i + 1

    end
  end
end
