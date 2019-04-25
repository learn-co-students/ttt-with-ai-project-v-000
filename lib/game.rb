require "pry"
class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2],    
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
    ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
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
    won? ? @board.position((won?[0] + 1).to_s) : nil
  end
  
  def valid_move?
    @board.position(input).between?(0,8) && !position_taken?
  end
  
  def turn 
    current_move = current_player.move(@board)
    if !board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{board.turn_count+1}\n"
      board.display
      board.update(current_move, current_player)
      puts "#{current_player} moved #{current_move}"
      board.display
    end 
  end 

  def play
    while !over?
      turn
    end 
    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end
end
  