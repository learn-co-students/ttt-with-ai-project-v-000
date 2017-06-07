class Game

#provides access to board, player 1 and player 2
attr_accessor :board, :player_1, :player_2

#array of winning combos
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

#initalize board and players
def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
   @board = board
   @player_1 = player_1
   @player_2 = player_2
 end

 #If the turn count is an even number, the #current_player method should return "X", otherwise, it should return "O"
  def current_player
      @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_array|
       if @board.cells[win_array[0]] == "X" && @board.cells[win_array[1]]== "X" && @board.cells[win_array[2]]=="X"||
          @board.cells[win_array[0]] == "O" && @board.cells[win_array[1]]== "O" && @board.cells[win_array[2]]== "O"
         return win_array
       end
     end
     false
   end

  def draw?
    @board.full? && !won?
   end

   def winner
     win_array = won?
     win_array ? @board.cells[win_array[0]] : nil
   end

   def input_to_index(user_input) #converts user_input to integer
     u_input = user_input.to_i
   end

   def move (index, current_player)
     @board.cells[index.to_i-1]= current_player.token
   end

 def turn
   user_input= current_player.move(@board)
    index = input_to_index(user_input)
      if @board.valid_move?(user_input)
         move(index, current_player)
         @board.display
      else
        turn
      end
  end


   def play
  until  over?
         turn
  end

  if won?!= false
    puts "Congratulations " "#{winner}!"

  elsif draw?
    puts "Cat's Game!"
  end
 end


 end
