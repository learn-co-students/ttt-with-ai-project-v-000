require 'pry'

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

  def initialize(player_1 = Players::Human.new("X"), player_2 =
  Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn = @board.turn_count + 1
    if turn.odd?
      player_1
    else
      player_2
    end
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_indices|
      @board.taken?(win_indices[0] + 1) &&
      @board.cells[win_indices[0]] == @board.cells[win_indices[1]] &&
      @board.cells[win_indices[1]] == @board.cells[win_indices[2]]
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    player = current_player
    input = player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, player)
      @board.display
    else
      puts "Invalid number"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players? (Enter 0-2)"
    input = gets.strip
    if input == "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      play
    elsif input == "1"
      puts ""
      puts "Please enter the player's name:"
      name1 = gets.strip
      # Here you will have to ask who goes first.
        # If person, go ahead and play, telling them to go first.
          #Assign player_2 to computer and then start play.
        # If computer, assign player_1 to computer and start play.
      puts "Let's play, #{name1}! You will be X, and you go first:"
      @player_2 = Players::Computer.new("O")
      play
    elsif input == "2"
      puts ""
      puts "Please enter player 1's name:"
        name1 = gets.strip
      puts "Please enter player 2's name:"
        name2 = gets.strip
      puts "Who goes first, #{name1} or #{name2}?"
        first = gets.strip
        if first == "#{name1}"
          first1 = first
          second = "#{name2}"
        else first == "#{name2}"
          first1 = first
          second = "#{name1}"
        end
      puts ""
      puts "Let's play, #{first1} and #{second}!"
      puts ""
      puts "#{first1}, you will be X."
      puts "#{second}, you will be O."
      puts ""
      puts "Go ahead, #{first1}:"
      play
    end
  end

end
