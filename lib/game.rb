# require 'pry'
# require_relative './players/human.rb'
# require_relative './player.rb'
# require_relative './board.rb'
# require_relative './players/computer.rb'

class Game

  attr_accessor :board, :player_1, :player_2, :current_player

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    elsif self.board.turn_count.odd?
      self.player_2
    end
  end

  def over?
    if self.board.full?
      true
    elsif self.won?
      true
    else
      false
    end
  end

  def win_line
    board_combinations = WIN_COMBINATIONS.collect do |win_array|
      win_array.collect {|index| self.board.cells[index]}
    end # at this point I expect board_combinations to resemble [["O", "X", "O"], ["X", "X", "O"], ["O","X", "O"] ... ]
    board_combinations.detect do |line|
      line.all?{|space| space == "O"} || line.all?{|space| space == "X"}
    end # win_line should at this point look like ["X", "X", "X"] OR ["O", "O", "O"] OR nil
  end

  def won?
    if self.win_line == ["X", "X", "X"]
      true
    elsif self.win_line == ["O", "O", "O"]
      true
    end
  end

  def draw?
    if self.win_line == nil
      true
    end
  end

  def winner
    if self.win_line == ["X", "X", "X"]
      "X"
    elsif self.win_line == ["O", "O", "O"]
      "O"
    end
  end

  def turn
    player_move = self.current_player.move(self.board)
    if self.board.valid_move?(player_move)
      self.board.update(player_move, self.current_player)
      self.board.display
    else
      loop do
        puts "That is not a valid move, please enter 1-9."
        player_move = self.current_player.move(self.board)
        if self.board.valid_move?(player_move)
          self.board.update(player_move, self.current_player)
          self.board.display
          break
        end # if end 2
      end # loop end
    end # if end 1
  end # def turn end

  def play
    puts "\nGAME ON! \nWhen it's your turn, choose which spot you'd like to play in by typing a number from 1-9. Each space in the board is represented by a number, as below."
    puts "\n\t\t\t| 1 | 2 | 3 |"
    puts "\t\t\t-------------"
    puts "\t\t\t| 4 | 5 | 6 |"
    puts "\t\t\t-------------"
    puts "\t\t\t| 7 | 8 | 9 |\n\n"
    # check whether the game is over
    until self.over?
      # make turns until the game is over
        self.turn
    end
    # when the game is over, congratulate the winner or print cats game
    if self.won?
      puts "Congratulations #{self.winner}!\n"
    elsif self.draw?
      puts "Cat's Game!\n"
    end
  end # def play end

  def self.who_goes_first
    puts "Would you like to go first, or would you like the computer to go first? (please type 'me' or 'computer')\n\n"
    first_player = gets.strip
    until /(?i)me/ === first_player || /(?i)computer/ === first_player do
      puts "Please type 'me' or 'computer'."
      first_player = gets.strip
    end
    first_player
  end

  def self.how_many_players
    puts "Would you like to play a game with 1 player (you against a computer)? 2 players (you against another human)? Or 0 players (a computer against another computer)? (please type '0', '1', or '2')\n\n"
    player_number = gets.strip.to_i
    until player_number == 1 || player_number == 2 || player_number == 0 do
      puts "Please type '0', '1', or '2'."
      player_number = gets.strip
    end
    player_number
  end

  def self.another_game
    puts "Would you like to play another game? (please type 'yes' or 'no')\n\n"
    again = gets.strip
    until /(?i)yes/ === again || /(?i)no/ === again do
      puts "Please type 'yes' or 'no'."
      again = gets.strip
    end
    again
  end

  def self.play_a_new_game
    player_number = self.how_many_players
    # accepting their input for # of players.
    if player_number == 1
      first_player = self.who_goes_first
      if /(?i)me/ === first_player # me
        # new game with human player as player 1
        self.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      elsif /(?i)computer/ === first_player # computer
        self.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
      end
    elsif player_number == 2
      self.new.play
    else # player_number == 0
      self.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    end

  end

end

# hat = Game.new
#
# hat.play
