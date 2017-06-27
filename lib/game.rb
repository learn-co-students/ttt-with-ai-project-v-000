require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left Column
    [1,4,7], # Middle Column
    [2,5,8], # Right Column
    [0,4,8], # Diagonal left to right
    [2,4,6]  # Diagonal right to left
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.player_1.token == 'X'
      self.board.turn_count % 2 == 0 ? player_1 : player_2
    else
       self.board.turn_count % 2 == 1 ? player_1 : player_2
     end
  end

  def full?
    !self.board.cells.include?(" ")
  end

  def over?
    self.full? || self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      pos_1 = self.board.cells[win_index_1]
      pos_2 = self.board.cells[win_index_2]
      pos_3 = self.board.cells[win_index_3]

      (pos_1 == player_1.token &&  pos_2 == player_1.token &&  pos_3 == player_1.token) ||
      (pos_1 == player_2.token &&  pos_2 == player_2.token &&  pos_3 == player_2.token)
      end
  end

  def draw?
    self.full? && !self.won?
  end

  def winner
      if self.won?
        pos = self.won?.first
        winning_token = self.board.cells[pos]
        winning_token == 'X' ? 'X' : 'O'
      else
        nil
      end
  end

  def turn
    self.board.display
    pos = self.current_player.move(self.board)
    if self.board.valid_move?(pos)
      self.board.update(pos, current_player)
    else
      "That move is not valid! Please choose again."
      pos = self.current_player.move(self.board)
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      self.board.display
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      self.board.display
      puts "Cat's Game!"
    end
  end

  def self.start_game
    puts "Please enter the number of players as '0' or '1' or '2' or enter 'wargames'"
    game_mode = gets.strip
    if game_mode == '2'
      puts "Which player should go first and be 'X'? Enter 'player 1' or 'player 2'"
      first_player = gets.strip
      if first_player == 'player 1'
        game = Game.new
      elsif first_player == 'player 2'
        player_2 = Players::Human.new('X')
        player_1 = Players::Human.new('O')
        game = Game.new(player_2, player_1)
      else
        puts "Invalid option! Please start over!"
        self.start_game
      end
    elsif game_mode == '1'
      puts "Would you or the computer like to go first and be 'X'? Enter 'me' or 'the machine' "
      first_player = gets.strip
      if first_player == 'me'
        player_1 = Players::Human.new('X')
        player_2 = Players::Computer.new('O')
        game = Game.new(player_1, player_2)
      elsif first_player == 'the machine'
        player_1 = Players::Computer.new('X')
        player_2 = Players::Human.new('O')
        game = Game.new(player_1, player_2)
      else
        puts "Invalid option! Please start over!"
        self.start_game
      end
    elsif game_mode == '0'
      player_1 = Players::Computer.new('X')
      player_2 = Players::Computer.new('O')
      game = Game.new(player_1, player_2)
    elsif game_mode == 'wargames'
      self.war_games
    else
      puts "Invalid option! Please choose again!"
      self.start_game
    end
    game.play
    Game.play_again?
  end

  def self.play_again?
    puts "Would you like to play another game? Enter 'yes' or 'no'"
    choice = gets.strip
    if choice == 'yes'
      start_game
    end
  end

  def self.war_games
    games_won = 0
    100.times do
      player_1 = Players::Computer.new('X')
      player_2 = Players::Computer.new('O')
      game = Game.new(player_1, player_2)
      game.play
      games_won += 1 if game.won?
    end
    puts "There were #{games_won} games won out of 100 games!"
  end
end
