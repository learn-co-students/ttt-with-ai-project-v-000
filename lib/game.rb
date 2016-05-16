require 'pry'
require_relative "../config/environment.rb"

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
   WIN_COMBINATIONS.detect do |winning_array|
      if self.board.cells[winning_array[0]] == "X" && self.board.cells[winning_array[1]] == "X" && self.board.cells[winning_array[2]] == "X"
        true
      elsif self.board.cells[winning_array[0]] == "O" && self.board.cells[winning_array[1]] == "O" && self.board.cells[winning_array[2]] == "O"
        true
      else
      end
    end    
  end

  def draw?
    board.full? && !won?
  end

  def winner
    x_counter = 0
    o_counter = 0
    self.board.cells.each do |cell|
      if cell == "X"
        x_counter += 1
      elsif cell == "O"
        o_counter += 1
      else
      end
    end

    if won? && x_counter > o_counter
      "X"
    elsif won? && o_counter >= x_counter
      "O"
    else  
    end    
  end

  def turn

    board.display
    players_move = current_player.move(board)
    
    if board.valid_move?(players_move)
      board.update(players_move, current_player) 
      
      #binding.pry
    else
      turn
    end


  end

  def play
    #binding.pry
    until over?
       turn
     end
     if won?
       board.display
       puts "Congratulations #{winner}!"
     elsif draw?
       board.display
       puts "Cats Game!"
     end

  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "How many human players are there?"

    input = gets.chomp

    if input == "0"
      Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O")).play
    elsif input == "1"
      puts "Would you like to go first? (Y/N)"
      self.one_player
    elsif input == "2"
      Game.new.play
    else
      puts "Sorry, the only options are 0, 1, or 2. \nLet's try this again."
      self.start
    end

    puts "Would you like to play another exciting game of Tic Tac Toe? (Y/N)"
    self.new_game?
    
  end

  def self.one_player
    new_input = gets.chomp

    if new_input == "Y" || new_input == "y"
      Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Computer.new("O")).play
    elsif new_input == "N" || new_input == "n"
      Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Human.new("O")).play
    else
      puts "Sorry, I couldn't understand that. Please enter Y or N:"
      self.one_player
    end
  end

  def self.new_game?
    

    input = gets.chomp

    if input == "Y" or input == "y"
      self.start
    elsif input == "N" or input == "n"
      puts "OK! Goodbye!"
    else
      puts "What was that? Please enter Y or N:"
      self.new_game?
    end
  end

end

 