class Game
  
  attr_accessor :board, :player_1, :player_2, :cells
  
  WIN_COMBINATIONS  = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7 ], [2, 5, 8], [0, 4, 8], [2, 4, 6], [1, 4, 7]]
  
  def initialize(player_1 = Players::Human.new, player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def board
    @board
  end
  
  def current_player
    player_one_array = []
    player_two_array = []
    x = player_1.token
    y = player_2.token
    board.cells.each do |item|
      if item == x 
        player_one_array << x 
        elsif item == y 
        player_two_array << y 
      end
    end
    if player_one_array.length > player_two_array.length
      player_2
      elsif player_two_array.length > player_one_array.length
      player_1
      elsif player_one_array.length == player_two_array.length
      player_1
    end
  end
  
  def won?
    y = []
    WIN_COMBINATIONS.each do |combo|
      if combo[0] == combo[1] && combo[1] == combo[2]
        y << combo
      end
    end
      if y.length == 0 
        false
      else 
        y
    end
  end
end
  
  
  
  #def won?
    #x_array = []
    #o_array = []
    #z = 8
    #y = []
    #umm = false
    #final_array = []
    #while z >= 0
    #if board.cells[z] == "X"
      #x_array << z 
      #z -= 1 
      #elsif board.cells[z] == "O"
      #o_array << z
      #z -= 1
      #end
    #end
    #WIN_COMBINATIONS.each do |combo|
      #if x_array.include?(combo[0]) && x_array.include?(combo[1]) && x_array.include?(combo[2])
        #y << combo
        #elsif o_array.include?(combo[0]) && o_array.include?(combo[1]) && o_array.include?(combo[2])
        #y << combo
      #end
    #end
    #if y.length > 0
      #y[0]
    #else
      #false
    #end
  #end
#end