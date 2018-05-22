class Game 
  
  
  attr_accessor :player_1, :player_2, :board
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
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
  
  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
 
  def turn 
    puts "It's #{current_player.token}'s turn."
    input = current_player.move(board).to_i 
  if @board.valid_move?(input)
    @board.update(input, current_player)
    @board.display
  elsif
    input.between?(1,9) == false 
    puts "That is an invalid move."
    turn 
  else
    puts "Looks like that position is already taken."
    turn
  end
  end
   
  def won?
    WIN_COMBINATIONS.find do |win_array|
     @board.cells[win_array[0]] == @board.cells[win_array[1]] && @board.cells[win_array[0]] == @board.cells[win_array[2]] && @board.taken?(win_array[0])
    end
   end
  end

  def winner
   @board.cells[won?[0]]  if won? 
  end
  
  def draw?
   @board.full? && !won? 
  end

  def over?
   draw? || won?
  end
  
  def play
   until over?
   turn
   if draw?
    puts "Cat's Game!"
   else won?
    puts "Congratulations #{winner}!"
   end
  end
end

 

