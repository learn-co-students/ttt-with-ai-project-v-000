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
        100.times do
          Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
        end
        puts "WARGAMES OVER!"
        self.display_scores
        self.x_wins = 0
        self.o_wins = 0
        self.draws = 0
      else
        puts "Please select 1-4 to start a new game"
        puts "\n"
        self.start
      end
    end

### SCORE KEEPER VARIABLES AND METHODS ###
    def self.draws
      @@draws
    end

    def self.draws= (i)
      @@draws += i
    end

    def self.x_wins
      @@x_wins
    end

    def self.x_wins= (i)
      @@x_wins += i
    end

    def self.o_wins
      @@o_wins
    end

    def self.o_wins= (i)
      @@o_wins += i
    end

    def update_score (winner = nil)
      case winner
      when "X"
        self.class.x_wins= (1)
      when "O"
        self.class.o_wins= (1)
      else
        self.class.draws= (1)
      end
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

### GAME MECHANICS ###
  def play
    self.board.display
    while !self.over?
      self.turn
    end
    if self.won?
      self.update_score(winner)
      puts "Congratulations #{winner}!"
    elsif self.draw?
      self.update_score
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
      self.turn
    end
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

### GAME END METHODS ###
  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      self.board.taken?(combo[0] + 1) &&
      self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
      self.board.cells[combo[0]] == self.board.cells[combo[2]]
    end
  end

  def draw?
    !self.won? && self.board.full?
  end

  def winner
    if winning_line = self.won?
      winner = self.board.cells[winning_line[0]]
    end
  end

end
