class Player::Computer < Player
  
  attr_accessor :board, :token, :best_spot, :at_play
  
  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2]
  ]
  
  
  def turn_count
    board.count {|token| token == "X" || token == "O"}
  end
  
  def move(board)
    @board = board
    # binding.pry

    if board.turn_count < 4
      puts "turn count less than 4"
      rand(1..9)
    elsif board.turn_count == 4
      puts "turn count is 4, returning car alarms"
      @at_play = open_shot
      take_the_shot
    else
      puts "random move"
      rand(1..9)
    end
  end

  def open_shot
    
    WIN_COMBINATIONS.detect do |combination|
      
      # HAS TO BE AN X OR O IF IT"S NOT EMPTY
      (@board.cells[combination[0]] != " " && @board.cells[combination[0]] == @board.cells[combination[1]] && @board.cells[combination[2]] == " ") ||
      
      #index 1 is not X or O and 0 is open; take 0
      (@board.cells[combination[1]] != " " && @board.cells[combination[1]] == @board.cells[combination[2]] && @board.cells[combination[0]] == " ") ||
      
      #index 2 is not X or O and 1 is open; take 1
      (@board.cells[combination[2]] != " " && @board.cells[combination[2]] == @board.cells[combination[0]] && @board.cells[combination[1]] == " ")
    end
    # binding.pry
  end
  
  def take_the_shot
    @at_play.each.with_index do |value, index|
      if @board.cells[value] == " "
        @score = index
      end
    end
    @score
  end
      
    
    
    
  
  # def block_rule
  #   @spots_we_tried = []
  #   # rand(1..9)
  #   
  #   # => detect if opponent has 2 in a row and place the third of winning combination
  #   # => what is two in a row?
  #   # matching any two of the winning combo
  #   
  #   
  #   WIN_COMBINATIONS.detect do |combination|
  #     win_combo0 = @board.cells.cells[combination[0]]
  #     win_combo1 = @board.cells.cells[combination[1]]
  #     win_combo2 = @board.cells.cells[combination[2]]
  #     
  #     if win_combo0 == win_combo1
  #       puts "win_combo0 == win_combo1"
  #       @best_spot = combination[2]
  #     elsif win_combo1 == win_combo2
  #       puts "win_combo1 == win_combo2"
  #       @best_spot = combination[0]
  #     elsif win_combo0 == win_combo2
  #       puts "win_combo0 == win_combo2"
  #       @best_spot = combination[1]
  #     else
  #       puts "no match found"
  #     end
  #   end
  #   block_rule if @spots_we_tried.include?(@best_spot)
  #   @spots_we_tried << @best_spot
  # 
  #   @best_spot
  # end
  
  def win_rule
    # => position on board
  end
  
end