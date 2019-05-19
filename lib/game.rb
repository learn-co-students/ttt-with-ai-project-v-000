class Game
  attr_accessor :board, :player_1, :player_2, :winner
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6] ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect {|combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] == @board.cells[combo[2]] && @board.taken?(combo[0] + 1)
    }
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if won?
      @winner = @board.cells[won?[0]]
    end
  end

  def turn
    #current_player is a function
    player = current_player
    puts "Player #{player.token}'s turn"
    puts "Enter 1-9:"
    move = player.move(@board)

    if @board.valid_move?(move)
      @board.update(move, player)
      @board.display
      puts "\n"
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    elsif won?
      @winner
      puts "Congratulations #{winner}!"
    end
  end

  def self.start

    puts "Welcome to Tic Tac Toe!"
    puts "How many human players: 0, 1 , or 2?"
    num_of_players = gets.strip

    if num_of_players == "2"
      game = self.new()
    elsif num_of_players == "1"
      puts "Who goes first? (Human/Computer)"
      first = gets.strip
      if first == "Human"
        game = self.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      elsif first == "Computer"
        game = self.new(player_1 = Players::Computer.new("X"))
      else
        self.start
      end
    elsif num_of_players == "0"
      game = self.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
    else
      puts "Invalid input."
      self.start
    end

    until game.over?
      game.play
    end
  end

end
