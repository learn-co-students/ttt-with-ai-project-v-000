class Game

  attr_accessor :board, :player_1, :player_2

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
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players? 0, 1 or 2"
    input = gets.strip.to_i
    if !input.between?(0,2)
      puts "Invalid entry, please choose between 0 and 2"
      start
    elsif input == 0
      new_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      new_game.play
    elsif input == 1
      puts "Hello, please enter your name:"
      player1 = gets.strip
      new_game = (player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      new_game.display
      new_game.play
    else input == 2
      puts "Who wants to be player 1?"
      puts "Please enter your name:"
      player1 = gets.strip
      puts "Hello #{player1}, you will be player X."
      puts "Player 2, please enter your name:"
      player2 = gets.strip
      puts "Hello #{player2}, you will be player 0."
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
      new_game.display
      new_game.play
    end
  end

end
