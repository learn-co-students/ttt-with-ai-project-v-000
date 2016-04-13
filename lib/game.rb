class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
                      [0,4,8], [6,4,2]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full? || won?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      [player_1, player_2].each do |player|
        board_values = win_combination.map { |index| board.position(index + 1) }
        return true if board_values.all? { |value| value == player.token }
      end
    end
    false
  end

  def draw?
    over? && !won?
  end

  def winner
    WIN_COMBINATIONS.each do |win_combination|
      [player_1, player_2].each do |player|
        board_values = win_combination.map { |index| board.position(index + 1) }
        return board_values.first if board_values.all? { |value| value == player.token }
      end
    end
    nil
  end

  def turn
    current_player.move(board)
    board.display
  end

  def play
    turn until over?
    if won?
      puts "Congratulations!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
