class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS=[
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board=Board.new) #the argument is a Board class instance
  @player_1 = player_1
  @player_2 = player_2
  @board = board

end
# def board
#   @board.cells
#     #@board= []
# end
def player_1
  @player_1
end
def player_2
  @player_2
end
def draw?
  if @board.full? == true && won? == false
    return true
  else
    return false
  end
end

def over?
  if won? != false || draw? == true || @board.full? == true
    return true
  else
    return false
  end

end
def won?
  WIN_COMBINATIONS.each do |combination| #NEED TO MAKE THATIT CHECKS ALL X'S FIRST THEN ALL O'S
    index1=combination[0]
    index2=combination[1]
    index3=combination[2]

    if @board.cells[index1]== "X" && @board.cells[index3]== "X" &&  @board.cells[index2] == "X"
      return combination
    end
  end
  WIN_COMBINATIONS.each do |combination| #NEED TO MAKE THATIT CHECKS ALL X'S FIRST THEN ALL O'S
    index1=combination[0]
    index2=combination[1]
    index3=combination[2]

    if @board.cells[index1]== "O" && @board.cells[index3]== "O" &&  @board.cells[index2] == "O"
      return combination
    end
  end

  return false
end
def current_player
  if @board.turn_count % 2 ==0
    return @player_1
  elsif @board.turn_count % 2 ==1
    return @player_2
  end
end

def move(index,character)
  @board.cells[index]=character
  return @board.cells
end

def turn
   puts "Please enter 1-9:"

  input= current_player.move(@board)


  if @board.valid_move?(input)
      #character= current_player.token
      @board.update(input,current_player)
      #index= input_to_index(input)
      #move(index,character)
      @board.display
  else
      turn
  end
end
def play

  until over? == true
    turn
  end
  if won? != false
    token= winner
    puts "Congratulations #{token}!"
  elsif draw? == true
    puts "Cat's Game!"
  end
end

def winner
  if win = won?
    return @board.cells[win[0]]

  end

end


end
