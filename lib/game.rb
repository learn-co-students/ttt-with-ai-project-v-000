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
      if tokens.count == 1 && tokens[0] != " "   # and feed it's individually to the values_at method as if we had
        return wins                              # a comma seperated list or fed them as individual parameters.
      end                                        #wins is the variable representing win combinations at index level
    end                                   #line 25 rets. token.count returns 1 unique element = x or o. and that one unique element is not a space.
    false
  end

  def draw?
    !(won? or @board.cells.include?(" "))
    #  return false if won? or @board.cells.include?(" ") # modifier version of the if. ?unique to Ruby. code before if will not run if false.
    #  return true #rework logic - into one line ## true unless won? or @board.cells.include?(" ")
  end

  def over?
    won? or draw?
  end

  def winner
    win_indexes = won? #false if no win, returns array of indexes if there is win
    if win_indexes      # there's a win, take the win index array
      @board.cells[win_indexes.first] #getting the token(x/o)at the 1st index position of the index array.Looking up the first index position in the @boardcells array
    else
      nil
    end
  end

  #def turn

  #end

  #def play

  #end

  #def start

  #end


end
