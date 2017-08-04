class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
   won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.taken?(combo[0] + 1) &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def turn
    board.display
    current_move = current_player.move(board)
    if board.valid_move?(current_move)
      board.update(current_move, current_player)
    else
      turn
    end
  end

  def play
    turn until over?
    if won?
      board.display
      puts "Congratulations #{winner}!"
    end
    if draw?
      board.display
      puts "Cat's Game!"
    end
  end

  def call
    puts "Welcome to Tic Tac Toe"
    start
  end

  def start
    puts ""
    puts "How many players - 0, 1, or 2?"
    player_number = gets.strip!

  #--------------AI vs AI ----------------------
    if player_number == "0"
      puts "Computer vs Computer eh? "
      puts "AI deathmatch initialize..."
      puts "FIGHT!"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      game.play


#--------------Player vs AI ----------------------
    elsif player_number == "1"
      puts "#{player_number} player it is !"
      puts "Do you want to go first and be X - "
      puts "Y or N ?"
      player_first = gets.chomp
      player_first == "y" || player_first =="Y"
      puts "You got it - you will play first."
      puts "Your token will be X"
      puts "LET'S PLAY ! "
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      game.play
    elsif player_first == "n" || player_first =="N"
      puts "You got it - you will play second."
      puts "Your token will be O"
      puts "Your confidence is admirable ?"
      puts "LET'S PLAY ! "
      game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      game.play

#--------------Player vs Player ----------------------

    elsif player_number == "2"
      puts "#{player_number} players it is !"
      puts "Ready ? "
      puts "FIGHT!"
      game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      game.play

     else
      puts "Invalid selection - try again pal"
      start
    end
    puts ""
    puts "Do you want to play again? Y or N"
    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thank you for playing!"
      exit
    end
  end


end
