class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [6,4,2], [0,3,6], [1,4,7], [2,5,8]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |current_player|
      unless board.cells[current_player.first] == " "
        board.cells[current_player[0]] == board.cells[current_player[1]] &&
        board.cells[current_player[1]] == board.cells[current_player[2]]
      end
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    return board.cells[won?.first] if won?
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    unless board.cells.valid_move?(input)
      puts "Invalid Entry"
      display
      input = gets.strip
    end
    board.cells.update(input, current_player)
  end

end
