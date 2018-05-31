class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    current_token = @board.cells.count {|pos| pos != " "} % 2 == 0 ? "X" : "O"
    @player_1.token == current_token ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? {|pos| @board.cells[pos] == "X"}
      return combo if combo.all? {|pos| @board.cells[pos] == "O"}
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    player = current_player
    puts "Please enter a number to place your token:"
    input = player.move(board)
    board.valid_move?(input) ? board.update(input, player) : turn
  end

  def play
    until over?
      turn
      board.display
    end
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
