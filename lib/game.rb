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
    x_array = []
    y_array = []
    z = 8
    while z >= 0
      if board.cells[z] = "X"
        x_array << z 
        z -= 1 
        elsif board.cells[z] = "Y"
        y_array << z 
        z -= 1
      end
    end
    while z >= 0 
    WIN_COMBINATIONS[z - 1].each do |index|
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    #player_one_index_array = []
    #player_two_index_array = []
    #temp_winning_combo = []
    #final_winning_combo = []
    #x = player_1.token
    #y = player_2.token
    #z = 9
    #binding.pry
    #while z > 0
      #if board.cells[z - 1] == x
        #player_one_index_array << z 
        #z -= 1 
        #elsif board.cells[z - 1] == y 
        #player_two_index_array << z 
        #z -= 1
      #end
    #end
    #while z >= 0 
    #WIN_COMBINATIONS[z - 1].each do |item|
      #if player_one_index_array.include?(item)
        #temp_winning_combo << item 
      #end
      #if temp_winning_combo.length == 3
        #final_winning_combo << temp_winning_combo
        #z = 0
        #elsif temp_winning_combo.length < 3 
        #z -= 1
      #end
    #end
  #end
  final_winning_combo[0]
  #end
#end