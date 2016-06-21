class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], #Top Row
    [3, 4, 5], #Middle Row
    [6, 7, 8], #Bottom Row

    [0, 3, 6], #Left Column
    [1, 4, 7], #Middle Column
    [2, 5, 8], #Right Column

    [0, 4, 8], #Diagonal 1
    [6, 4, 2] #Diagonal 2
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      win.all? {|p| board.cells[p] == "X"} || win.all? {|p| board.cells[p] == "O"}
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    the_winner = won?
    won? ? board.cells[the_winner[0]] : nil
  end

  def turn
    input = current_player.move(board)

    board.valid_move?(input) ? board.update(input, current_player) : turn
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

  def start
    puts "Welcome! How many players?"

    mode = gets.strip

    if mode == 0
      Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
      game.play
    elsif mode == 1
      Game.new(Player::Human.new("X"), Player::Computer.new("O"))
      game.play
    elsif mode == 2
      Game.new(Player::Human.new("X"), Player::Human.new("O"))
      game.play
    else
      puts "Please enter 0, 1 or 2."
      start
    end

    puts "Would you like to play again?"

    response = gets.strip

    if response == "yes"
      game.play
    elsif response == "no"
      exit
    else
      puts "Please enter yes or no."
    end
  end

end # => Game Class