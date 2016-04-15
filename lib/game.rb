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
    draw? || won?
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
    board.full? && !won?
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
    player = current_player
    current_move = player.move
    if !board.valid_move?(current_move)
      puts "Invalid move."
      turn
    else
      puts "Turn: #{board.turn_count+1}\n"
      board.display
      board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      board.display
      puts "\n\n"
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
