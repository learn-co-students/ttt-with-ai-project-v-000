class Player
  attr_accessor :opponent, :winning_index, :player_num
  attr_reader   :token, :board_positions

  # :token is the player's token, :board_positions are the board cells the player's :token occupies in the order they
  # were filled.
  def initialize(token)
    @token = token
    @board_positions = []

    # Singleton method for :board_positions to convert shoveled player input into appropriate board cell.
    class << @board_positions
      def <<(input)
        super(input.to_i - 1)
      end
    end
  end

  def player_1?
    player_num == 1
  end

  # Check if there are any WIN_COMBINATIONs where exactly two squares are filled by the player's token.
  # If so, then the third square is the player's winning index.
  def win_possible?(board)
    Game::WIN_COMBINATIONS.any? do |win_combo|
      next unless win_combo.select { |i| board.position(i + 1) == token }.size == 2
      self.winning_index = win_combo.select { |i| board.position(i + 1) == ' '}.first
    end
  end

  # Return the opposite cell of any given player board position. The center square will return itself.
  def opposite_cell(index)
    (board_positions[index] - 8).abs
  end
end
