class Game
  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 4, 8],
      [6, 4, 2],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
  ].freeze
  CORNERS = [0, 2, 6, 8].freeze
  SIDES = [1, 3, 5, 7].freeze
  CENTER = 4

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board    = board
    @player_1.opponent, @player_1.player_num = @player_2, 1
    @player_2.opponent, @player_2.player_num = @player_1, 2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    won = nil

    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |cell| board.cells[cell] == 'X' } || combo.all? { |cell| board.cells[cell] == 'O' }
        won = combo
        return won
      end
    end

    won
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.cells[won?.first] if won?
  end

  def turn
    puts "#{current_player.token}, please enter 1-9"
    input = current_player.move(board)
    unless board.valid_move?(input)
      board.display
      return turn
    end
    current_player.board_positions << input
    board.update(input, current_player)
    board.display
  end

  def play
    board.display
    player_1.board_positions.clear
    player_2.board_positions.clear
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end
