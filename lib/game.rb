class Game 

WIN_COMBINATIONS =[
    [0,1,2], 
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]



attr_accessor :board, :player_1, :player_2

 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
   @board = board
   @player_1 = player_1
   @player_2 = player_2
   
  end 
  
  def current_player
    if @board.turn_count % 2 == 0
      return @player_1
    else
      return @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |i|
    win_position_1 = i[0]
    win_position_2 = i[1]
    win_position_3 = i[2]

      if @board.cells[win_position_1] == @board.cells[win_position_2] && @board.cells[win_position_2] == @board.cells[win_position_3] && @board.cells[win_position_1] != " "
        return i
      end
    end
    false
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
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move) == true
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, current_player)
      @board.display
    else
      turn
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