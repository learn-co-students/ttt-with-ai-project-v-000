require 'pry'

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      (@board.cells[combo[0]] == @board.cells[combo[1]]) && (@board.cells[combo[0]] == @board.cells[combo[2]]) &&
      @board.cells[combo[0]] != " "
    end
  end

  def draw?
    won? == false && @board.full? == true
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      if @board.cells.count("X") <= @board.cells.count("O")
        "O"
      else
        "X"
      end
    else
      nil
    end
  end

  def turn
    player = self.current_player
    move = player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif
      draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "Welcome to Tic-Tac-Toe with AI!"
    puts "Do you want to play a game with 0, 1, or 2 players? You can also select 'wargames'."
    type = gets.strip

    case type

      when "0"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      when "1"
        puts "You selected a one player game. If you would like to be 'X' and go first, type 'X'. If you would like to be 'O' and go second, type 'O'."
        human = gets.upcase.strip
        if human == "X"
          game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        elsif human == "O"
          game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        else
          puts "Start over. You have to pick a valid player."
          self.start
        end
      when "2"
        puts "You selected a two person game. 'X' goes first."
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      when "wargames"
        Game.wargames
      else
        puts "Select a valid game type."
        self.start
    end
    game.play
    puts "Would you like to play again? (Y, N)"
    input = gets.upcase.strip
    if input == "Y"
      Game.start
    else
      exit!
    end
  end

  def self.wargames
    counter = 0
    wins = 0
    while counter < 100
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      game.play
      if game.won?
        wins += 1
      end
      counter += 1
    end
    puts "There was a winner in #{wins} of 100 games"
    puts "Would you like to play again? (Y, N)"
    input = gets.upcase.strip
    if input == "Y"
      Game.start
    else
      exit!
    end
  end

end
