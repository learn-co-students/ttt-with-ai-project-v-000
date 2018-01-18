class Game
  include Players
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |formation|
      first_spot = @board.cells[formation[0]]
      second_spot = @board.cells[formation[1]]
      third_spot = @board.cells[formation[2]]
      first_spot == second_spot && first_spot == third_spot && first_spot != " "
    end
  end

  def draw?
    @board.full? && (won? == nil)
  end

  def winner
    if victorious_formation = won?
      @board.cells[victorious_formation.first]
    end
  end

  def turn
    string_input = current_player.move(board)
    if @board.valid_move?(string_input)
      @board.update(string_input, current_player)
      @board.display
    else
      "invalid"
      turn
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
