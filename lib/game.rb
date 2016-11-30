require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winner

  Game::WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

  def initialize(player_1 = "", player_2 = "", board =[])
    winner = ""
    board == [] ? @board = Board.new : @board = board
    if player_1 != ""
      @player_1 = player_1
    else
      @player_1 = Human.new("X")
    end
    if player_2 != ""
      @player_2 = player_2
    else
      @player_2 = Human.new("O")
    end
  end

  def current_player
    if @board.cells.select{|space| space == " "}.count % 2 == 0
      player_2
    else
      player_1
    end
  end

  def over?
    won? || draw?
  end

  def won?
  Game::WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def winner
    if combo = won?
      @board.cells[combo[0]]
    end
  end

  def draw?
    (@board.full? && !won?)
  end

  def start
    number = 5
    puts "Welcome to Tic-Tac-Toe. A challenging game of skill."
    puts "You can play with a friend, by yourself, or let the computer play itself."
    while !number.between?(0,2)
      puts "How many players are there? Please enter 0, 1, or 2."
      number = gets.strip.to_i
    end
    if number == 0
      @player_1 = Computer.new("X")
      @player_2 = Computer.new("O")
    elsif number == 1
      token = nil
      while (token != "X" && token != "O")
        puts "Do you want to be X or O?"
        token = gets.strip.upcase
      end
      if token == "X"
        @player_1 = Human.new("X")
        @player_2 = Computer.new("O")
      elsif token == "O"
        @player_1 = Computer.new("X")
        @player_2 = Human.new("O")
      end
    elsif number == 2
      @player_1 = Human.new("X")
      @player_2 = Human.new("O")
    end
    @board.display
    self.play
    again = nil
    while (again != "Y" && again != "N")
      puts "Do you want to play again? (Y/N)"
      again = gets.strip.upcase
    end
    if again == "Y"
      @board.reset!
      start
    elsif again == "N"
      puts "Goodbye!"
      exit
    end

  end


  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"

    elsif draw?
      puts "Cats Game!"

    end
  end

  def turn
    valid = @board.update(current_player.move(@board), self.current_player)
    while !valid
      puts "invalid"
      valid = @board.update(current_player.move(@board), self.current_player)
    end
    puts "Turn: #{board.turn_count+1}"
    puts "Go #{current_player.token}!"
    puts
    @board.display
    puts
  end

end
# >
# [9] pry(#<Game>)> self.over?
# => false
# [10] pry(#<Game>)> self.over?
# => true
