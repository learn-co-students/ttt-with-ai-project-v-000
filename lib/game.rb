require 'pry'
class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # diagonal 1
    [2, 4, 6]  # diagonal 2
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2 
    @board = board 
  end 
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] &&
      @board.cells[winner[1]] == @board.cells[winner[2]] && 
      (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
    end
  end 
  
  def draw?
    @board.full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    won? ? @board.cells[won?[0]] : nil
  end 
  
  def turn
    position = current_player.move(@board)
    @board.valid_move?(position) ? @board.update(position, current_player) : turn 
  end 
  
  def play 
    while !over? do 
      turn
      @board.display
    end 
    
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end 
  
  def wargames
    x_wins = 0 
    o_wins = 0 
    ties = 0 
    game_count = 0 
    
    100.times do 
      while !over? 
        turn
        @board.display
      end
      
      ties += 1 if draw? 
      
      if won?
        x_wins += 1 if winner == "X"
        o_wins += 1 if winner == "O"
      end
      game_count += 1 
    end 
    
    puts "After #{game_count} AI vs AI games:"
    puts " -ties: #{ties}"
    puts " -'X' wins: #{x_wins}"
    puts " -'O' wins: #{o_wins}"
    
  end 
  
end 