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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def over?
    won? || draw?
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if !@board.valid_move?(current_move)
      @board.display
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
      puts "\n\n"
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
      # The analogy of a cat will never win at catching it's tail.
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def self.welcome
    puts "Hi, welcome to Tic Tac Toe. Please input the number of players(0, 1, or 2):"
    players = gets.strip.to_i
    if players == 1 || players == 2
      puts "Enter 1 for player 1 to be X, enter 2 for player 2 to be X"
      token = gets.strip.to_i
    end
    puts "Iniatlizing your game."


    if players == 1 && token == 1
      self.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
    elsif players ==1 && token == 2
      self.new(player_1 = Players::Human.new("O"), player_2 = Players::Computer.new("X"), board = Board.new).play
    elsif players == 2 && token == 1
      self.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
    elsif players == 2 && token == 2
      self.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"), board = Board.new).play
    else
      self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
    end

    puts "Would you like to play again? Please enter Y or N"
    input = gets.strip.upcase
    if input == "Y"
      self.welcome
    end
  end

end
