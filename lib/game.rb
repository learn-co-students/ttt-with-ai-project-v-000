require 'pry'
class Game
  
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  attr_accessor :board, :player_1, :player_2
 
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    player_turn = @board.turn_count
    if player_turn.even?
      @player_1 # X-O, now X turn
    else
      @player_2 #X-O-X (odd), now O turn
    end
  end
  
  def over?
    draw? || won?
  end
  
  def won?
    winner = Array.new
    WIN_COMBINATIONS.each do |win|
    
      if @board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]] && @board.cells[win[1]] != " "
        winner << win
      end
    end
    
    if winner.empty?
      false
    else
      winner.flatten
    end
  end
  
  def draw?
    if won? == false && @board.full?
      true
    else
      false
    end
  end
  
  def winner
    x_or_o = won?
    if x_or_o == false
      nil
    else
      @board.cells[x_or_o[0]]
    end
  end
  
  def turn
    pos = current_player.move
    until (pos.to_i > 0 && pos.to_i < 10)
      pos = current_player.move
    end
    @board.update(pos, current_player)
    pos
  end
  
  def play
    until over?
      turn
    end
    
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
  
  def start
  end
end