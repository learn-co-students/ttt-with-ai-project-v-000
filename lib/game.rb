class Game 
  
  attr_accessor :player_1, :player_2, :board, :token
  
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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end 
  
  def current_player
    token = @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  
  def won? 
    if WIN_COMBINATIONS.any?{ |combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && !(@board.cells[combo[1]] == " ") }
      winner = WIN_COMBINATIONS.find{ |combo| @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] }
      winner
    else 
      false
    end
  end 
    
  def draw?
    @board.full? && !won?
  end
  
  def over?
    draw? || won?
  end 
  
  def winner 
    if won? 
      @board.cells[won?.first]
    else 
      nil 
    end 
  end 
  
  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.valid_move?(input)
      @board.update(input, current_player)
    else
      turn
    end
  end 
  
  def play 
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 
    
end 