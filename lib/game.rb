class Game
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [2,5,8],
  [1,4,7],
  [0,4,8],
  [2,4,6]
  ]
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if board.turn_count.even?
      @player_1
    elsif board.turn_count.odd?
      @player_2
    end
  end
  
  def full
    board.cells.all?{|space| space =="X"|| space =="O"}
  end
  
  def over?
    draw? || won?
  end 
  
  
  def draw?
    board.cells.all?{|space| space =="X"|| space =="O"}
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combinations|
      # win_combinations == [3,4,5]
      index_1 = win_combinations[0] # 3
      index_2 = win_combinations[1] # 4
      index_3 = win_combinations[2] # 5
      
      position_1 = board.cells[index_1] 
      position_2 = board.cells[index_2]
      position_3 = board.cells[index_3]
      
      position_1 == position_2 && position_2 == position_3 && board.taken?(index_1 + 1)
    end 
  end 
  
  def draw?
    full && !won?
  end 
  
  def winner
    if won?
      array = won?
      board.cells[array.first]
    end 
  end
  
  def turn 
    player = current_player
    input = player.move(board)
    if board.valid_move?(input)
      board.update(input, player)
      board.display
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