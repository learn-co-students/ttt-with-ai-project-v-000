class Player
  attr_accessor :opponent, :winning_index, :player_num
  attr_reader   :token, :board_positions

  def initialize(token)
    @token = token
    @board_positions = []

    class << @board_positions
      def <<(input)
        super(input.to_i - 1)
      end
    end

  end

  def player_1?
    player_num == 1
  end

  def win_possible?
    Game::WIN_COMBINATIONS.each do |win_combo|
      win_combo.each do |win_index|
        board_positions.each do |pos|
          next unless win_index == pos
          win_combo -= [win_index]
          next unless win_combo.length == 1
          self.winning_index = win_combo[0]
          next unless opponent.board_positions.none? { |i| i == winning_index }
          return true
        end
      end
    end
    false
  end

  def opposite_corner(index)
    (board_positions[index] - 8).abs
  end
end