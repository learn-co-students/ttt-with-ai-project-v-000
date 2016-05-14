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
    counter = 1
    board.cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    if counter.odd?
      player_1
    else
      player_2
    end
  end

  def over?
    if board.cells.all? do |cell|
      cell == "O" || cell == "X"
      end
      true
    else
      false
    end
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
    over? && !won?
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
    elsif won? && o_counter > x_counter
      "O"
    else  
    end    
  end

  def turn

    puts "Please select a move (1-9):"
    players_move = current_player.move(board)
    

    #if board.valid_move?(players_move)
     # board.update(players_move, current_player)
    #else
     # current_player.move(board)
    #end
    




    if board.valid_move?(players_move)
      board.update(players_move, current_player) 
      #binding.pry
    else
      turn

      
    end

  end

  def play
    #binding.pry
    turn
    board.display
    if over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      else
      end
    else
      play
    end

    #end
    #while over? == false && won? == false && draw? == false
    #  turn
    #end
    
    

    #if won?
    #  puts "Congratulations #{winner}!"
    #elsif draw?
    #  puts "Cats Game!"
    #end

    #until self.over?
    #  puts board
    #  turn 
    #end




  end

end

#game = Game.new
#binding.pry

 