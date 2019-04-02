

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
    [6,4,2]
  ]




  def initialize(player_1, player_2)
  
    @board = Board.new
    @player_1 = player_1
    @player_2 = player_2
    @win_combo = nil
  end

  def current_player
   @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end 

  def draw?
    if @board.full? && !won?
      true 
    else 
      false
    end 
  end

  def won?
    token = (current_player == player_1 ? player_2.token: player_1.token)
    WIN_COMBINATIONS.detect do |combo|
      token == @board.cells[combo[0]] && 
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] 
    end   
  end 

  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end 
  end 

  def over?
    case @board.turn_count
    when 1..4
      false
    when 5..8
      won?
    when 9
      won? || draw?
    end  
  end 

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn Number: #{@board.turn_count+1}\n"
      @board.display
      @board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      @board.display
    end
  end

  def play 
    if over? 
      if won?  
        puts "Congratulations #{winner}!"
      else 
        puts "Cat's Game!"  
      end 
    else 
      turn
      play  
    end 
  end 
  
end 
