require "pry"

class Game
  attr_accessor :board, :player_1, :player_2
  @@draws = 0
  @@x_wins = 0
  @@o_wins = 0

  WIN_COMBINATIONS =
    [[0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  #binding.pry

  def self.start
    puts "Type the number of the mode would you like to play:"
    puts "1. Player vs. Computer"
    puts "2. Player vs. Player"
    puts "3. Computer vs. Computer"
    puts "4. Wargames! See the average wins of 100 Computer vs. Computer games"
    puts "\n"
    game_type = gets.chomp
    case game_type
      when "1"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      when "2"
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
      when "3"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
      when "4"
        #where should the logic for the repeating and reporting go?
        #make method for wargames!
        100.times do
          Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
        end
        puts "WARGAMES OVER!"
        self.display_scores
        self.x_wins = 0
        self.o_wins = 0
        self.draws = 0
        #refactor to make wargames go quicker...
        #custom Computer#move? to make it quicker?
      else
        puts "Please select 1-4 to start a new game"
        puts "\n"
        self.start
      end
    end

    def self.draws
      @@draws
    end

    def self.draws= (game)
      @@draws += game
    end

    def self.x_wins
      @@x_wins
    end

    def self.x_wins= (game)
      @@x_wins += game
    end

    def self.o_wins
      @@o_wins
    end

    def self.o_wins= (game)
      @@o_wins += game
    end

### GAME MECHANICS ###
  def play
    self.board.display
    while !self.over?
      turn
    end
    if self.won? != false
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

  def turn
    player = self.current_player
    position = player.move(self.board)
    if  self.board.valid_move?(position)
      self.board.update(position, player)
      self.board.display
    else
      turn
    end
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

### GAME END METHODS ###
  def over?
    true if self.board.full? || self.won? != false || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && (position_1 == "X" || position_1 == "O")
        return win_combination
      end
    end
    return false
  end

  def draw?
    if self.won? == false && self.board.full? == true
      self.class.draws= (1)
      true
    elsif self.won? == false && self.board.full? == false
      false
    elsif self.won? != false
      false
    end
  end

  def winner
    if self.won? == false || self.draw? == true
      nil
    else
      winning_line = self.won?
      index = winning_line[0]
      winner = self.board.cells[index]
      if winner == "X"
        self.class.x_wins= (1)
      elsif winner == "O"
        self.class.o_wins= (1)
      end
    end
    winner
  end

  def self.display_scores
    puts "\n"
    puts "\n"
    puts "SCORES:"
    puts "\n"
    puts "Player X: #{self.x_wins}"
    puts "Player O: #{self.o_wins}"
    puts "Draws:    #{self.draws}"
    puts "\n"
    puts "Thanks for playing!"
    puts "\n"
  end

end
