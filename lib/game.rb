require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :first_player, :second_player

  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
   ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board.cells[win_combination[0]]
      position_2 = board.cells[win_combination[1]]
      position_3 = board.cells[win_combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def draw?
    board.full? && self.won? == false
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if won? != false
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    player = self.current_player
    players_move = player.move(self.board)
    if board.valid_move?(players_move)
      board.update(players_move, player)
      players_move
    else
      puts "Invalid move." unless self.current_player.class == Players::Computer
      turn
    end
  end

  def play
    until over?
      puts "Where would you like to go? Choose a space between 1-9."
      board.display
      turn
    end
    if won? != false
      board.display
      puts "Congratulations #{winner}!"
    else
      board.display
      puts "Cat's Game!"
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "Are you playing 0-player, 1-player, or 2-player?"
    game_players = gets.strip

    if game_players == "2-player" || game_players == "2"
      self.player_1 = Players::Human.new("X")
      self.player_2 = Players::Human.new("O")
    elsif game_players == "1-player" || game_players == "1"
      puts "Do you want to be X and go first? y/n"
      answer = gets.strip
        if answer == "y" || answer == "yes"
          self.player_1 = Players::Human.new("X")
          self.player_2 = Players::Computer.new("O")
        elsif answer == "n" || answer == "no"
          self.player_1 = Players::Computer.new("X")
          self.player_2 = Players::Human.new("O")
        end
    elsif game_players == "0-player" || game_players == "0"
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
    end

    self.play
  end

end
