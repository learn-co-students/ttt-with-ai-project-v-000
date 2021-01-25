class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
                      [0,3,6], [1,4,7], [2,5,8],
                      [0,4,8], [6,4,2]]

  def initialize(player1=Players::Human.new("X"), player2=Players::Human.new("O"), brd=Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = brd
  end

  def current_player
    if @board.turn_count.even?
      return @player_1
    else
      return @player_2
    end
  end

 def won?
   WIN_COMBINATIONS.each do |wins|              #values_at method accepts a variable number of arguments
    tokens = @board.cells.values_at(*wins).uniq # splat(*) take the array and take each element in the array
     if tokens.count == 1 && tokens[0] != " "   # and feed it's individual to the values_at method as if we had
       return wins                              # a comma seperated list or fed them as individual parameters.
     end
   end
   false
 end

 def draw?
   WIN_COMBINATIONS.each do |wins|
     tokens = @board.cells.values_at(*wins).uniq
     if tokens.count
  end

#def over?

#end

#def turn

#end

#def play

#end

#def start

#end


end
