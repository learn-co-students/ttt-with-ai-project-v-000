class Board 
  attr_accessor :cells  
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display 
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    @cells[input.to_i - 1]
  end 
  
  def full?
    @cells.include?(" ") ? FALSE : TRUE 
  end
  
  def turn_count 
    @cells.select {|cell| cell == "X" || cell == "O"}.size 
  end
  
  def taken?(position)
    @cells[position.to_i - 1] != " " 
  end 
  
  def valid_move?(position)
    if position.to_i > 0 && position.to_i < 10 
      if taken?(position) 
        FALSE
      else
        TRUE
      end
    else
      FALSE
    end
  end 
  
  def update(move, token)
    if valid_move?(move) == TRUE
      @cells[move.to_i - 1] = token.token
    end
  end 
end