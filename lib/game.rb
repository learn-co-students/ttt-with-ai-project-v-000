class Game

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


attr_accessor :board , :player_1, :player_2

#how can you have a instnace variable of another class instanciate another Class?
def initialize(player_1 = Players::Human.new("X"),
  player_2 = Players::Human.new("O"),
  board = Board.new)
  @board= board
  @player_1= player_1
  @player_2= player_2
end

  def current_player
    if turn_count.even? #player_2 is even, always goes second
      @player_1 #return player_1 - they will become the current player after an even turn_count
    else
      @player_2
    end
  end


  def turn_count
    @board.cells.count {|position| position !=" "}
  end

  #won -returns an array of the winning combo
  def won?
        WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
      end
  end


  def draw?
    !won? && board.full?
  end


  def over?
    draw? || won? || board.full?
  end


#sets a variable equal to the winning combo
#then returns the value of the first index of winning combo array(you can use last too)
  def winner
    if winning_combo = won?
      board.cells[winning_combo.first]
    end
  end



  #turn
    def turn
      puts "Please enter a number between 1-9:"
      output = current_player.move(board)
      if board.valid_move?(output)
        board.update(output,current_player)#you have to turn the state of the board because that is the only way current_player switches
        output#you don't need to loop around again - the test has turn method called twice and current_player is abstract enough
        board.display
      else
        puts "Invalid move - try again:"
        turn
      end
    end

 #play
 def play
   until over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   else
     puts "#{current_player}'s Game!"
   end
 end



end
