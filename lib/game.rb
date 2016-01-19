class Game 
  attr_accessor :cells, :player_1, :player_2, :board

   WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],
[1,4,7], [2,5,8], [0,4,8], [6,4,2]]


  def initialize(play1 = Player::Human.new('X'), play2 = Player::Human.new('O'), boar = Board.new)
    @player_1 = play1
    @player_2 = play2
    @board = boar

  end

  def current_player
    if board.turn_count % 2 == 0 
      @player_1 
    else 
      @player_2 
    end 
  end

  def over?
    true if board.full? 
  end

 def won?
   ans = ''
   WIN_COMBINATIONS.each{|x|
    if board.cells[x[0]] == board.cells[x[1]] && board.cells[x[1]] == board.cells[x[2]] && board.cells[x[0]] == board.cells[x[2]] && board.cells[x[2]] != ' '
      @won_player = board.cells[x[0]]
      return ans = true 
    else 
     ans = false 
    end
    }
    ans 
  end

  def draw?
    board.full? && !won? 

  end

  def winner 
    won? 
    @won_player
  end

 def turn
  puts "Choose a number between 1-9"
  mov = current_player.move(board)
  
  until board.valid_move?(mov)
    puts "Try again"
    mov = current_player.move(board)
   end
   board.update(mov, current_player)
   
 end
  
def play
  puts "Hello, input a number on your turn!"
  loop  do 9.times
   
   if won? 
    puts "Congratulations #{winner}!"
      break 
   end 
  
  if  draw?
   puts 'Cats Game!'
   break 
   end 
  turn 
  over?
  @board.display
  end 
   
end 

end 








