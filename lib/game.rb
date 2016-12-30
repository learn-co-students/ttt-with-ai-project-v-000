class Game

  # Game constants for winning combinations and corner, side and center cells.
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

  # Initialize a game, setting the players and the board, plus the :opponent and :player_num of both players.
  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board    = board
    @player_1.opponent   = @player_2
    @player_1.player_num = 1
    @player_2.opponent   = @player_1
    @player_2.player_num = 2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  # Find the first WIN_COMBINATION where every cell is an 'X' or every cell is an 'O'.
  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |cell| board.cells[cell] == 'X' } || combo.all? { |cell| board.cells[cell] == 'O' }
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  # Make sure each player's board positions are clear. Take turns until the game is over, and declare if won or draw.
  def play
    board.display
    player_1.board_positions.clear
    player_2.board_positions.clear
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  # Ask the player for a selection. Check if it's valid, and the cell to the player's tally of board positions
  # and update the board. If it's not, display the board and ask again.
  def turn
    puts "#{current_player.token}, please enter 1-9"
    input = current_player.move(board)
    if board.valid_move?(input)
      current_player.board_positions << input
      board.update(input, current_player)
      board.display
    else
      board.display
      return turn
    end
  end
end
