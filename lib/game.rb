require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # left diagonal
    [6,4,2] # right diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]] && self.board.cells[combo[0]] != " "
        combo
      end
    end
  end

  def draw?
    !self.won? && self.board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    if self.current_player.class == Players::Human
      sleep(0.75)
      puts "#{self.current_player.token}, it's your turn. Please enter 1-9:"
    elsif self.current_player.class == Players::Computer
      sleep(0.75)
      puts "The computer is planning its next move..."
      sleep(1)
    end
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
      sleep(0.5)
      self.board.display
    else
      puts "Your move was not valid. Try again!"
      self.turn
    end
  end

  def play
    if !self.over?
      self.turn
      self.play
    elsif self.won?
      sleep(0.75)
      puts "Congratulations #{winner}!"
    elsif self.draw?
      sleep(0.75)
      puts "Cat's Game!"
    end
  end

  def zero_player_game
    puts "Enjoy the show!"
    sleep(0.5)
    game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
    game.play
  end

  def one_player_game
    puts "Great! You'll be playing against the computer. What is your name?"
    name = gets.strip.capitalize
    sleep(0.5)
    puts "Nice to meet you, #{name}! Who should go first? Enter 'me' or 'computer'."
    first_player = ""

    while first_player == ""
      first_player = gets.strip
      sleep(0.5)
      if first_player == "me"
        puts "OK, #{name}! You'll be X."
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
        game.play
      elsif first_player == 'computer'
        puts "OK, #{name}! You'll be O."
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
        game.play
      else
        puts "I'm sorry, #{name}, the player you entered is invalid. Please enter 'me' or 'computer'."
        first_player = ""
      end
    end
  end

  def two_player_game
    puts "Great! Who will be player 1?"
    first_player = gets.strip.capitalize
    sleep(0.5)
    puts "OK! #{first_player}, you will be X."
    sleep(0.5)
    puts "And who will be player 2?"
    second_player = gets.strip.capitalize
    sleep(0.5)
    puts "Great! #{second_player}, you will be O."
    sleep(0.5)
    puts "Let the games begin!"
    game = Game.new
    game.play
  end

  def wargames
    # 100.times { self.zero_player_game }
    self.won?.count
  end

  def start
    number = gets.strip

    sleep(0.5)
    if number == "0"
      self.zero_player_game
    elsif number == "1"
      self.one_player_game
    elsif number == "2"
      self.two_player_game
    elsif number == "wargames"
      self.wargames
    else
      puts "I'm sorry, I didn't catch that. Please enter a valid number between 0 and 2."
      self.start
    end

  end

end

# If you'd like, implement a "wargames" game type. When asked what kind of game they want to play or for the number of players, if the user types in "wargames", have the computer play itself 100 times and report how many times the game was won. This is not a requirement, it would just be fun. A perfect computer AI should never be able to win, like in the case of thermonuclear war.
