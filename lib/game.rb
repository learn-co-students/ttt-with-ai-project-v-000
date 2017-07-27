require 'pry'
class Game
  attr_accessor :board,:player_1,:player_2
  WIN_COMBINATIONS =
  [
    [0,1 ,2], # Top row
    [3,4,5],  # Midlle row
    [6,7,8], # last row
    [0,3,6], # left column
    [1,4,7], # Midlle column
    [2,5,8], # right column
    [0,4,8], # Midlle to the right
    [2,4,6], # Midlle to the left
  ]

def initialize(player1=Players::Human.new("X"),player2=Players::Human.new("O"),board=Board.new)
 @player_1=player1
  @player_2=player2
  @board=board
end
def current_player
  val_count=@board.turn_count
    if (val_count%2==0)
        return @player_1
    else
        return @player_2
    end
end
def over?
  if self.won?
        true
  else
        @board.full?
  end
end

def won?
  won= WIN_COMBINATIONS.each do |win_combo|
    if @board.cells[win_combo[0]] == "X" && @board.cells[win_combo[1]]  == "X" && @board.cells[win_combo[2]]  == "X"
    return win_combo
  elsif@board.cells[win_combo[0]]  == "O" && @board.cells[win_combo[1]]  == "O" && @board.cells[win_combo[2]]  == "O"
     return win_combo
    end
  end
    return false
end


  def draw?
    (!self.won? && @board.full?)
  end

 def winner
    won=self.won?
     if (won)

       return @board.cells[won[0]]
     end
  end


  def turn
     input=self.current_player.move(@board)

    if (@board.valid_move?(input))
         @board.update(input,self.current_player)
         @board.display
     else
        self.turn
     end
  end

  def play
    until self.over?
      self.turn
      if (self.draw?)
        break
      end
    end
    if self.won?
       puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
  end
end






end
