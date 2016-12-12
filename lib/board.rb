class Board 
  attr_accessor :cells 
  
  
  def initialize
    @cells = Array.new(9," ")
  end

  def reset!
    self.cells =[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    ## line spacing
    puts ""
    puts""
  end


  def position(position)
     @cells[position.to_i-1]
  end

  def full?
    @cells.all?{|piece|piece == "X" || piece == "O"}
  end

  def turn_count
    x=0
    @cells.each do |piece|
      if piece == "X" || piece == "O"
        x+=1
      end
    end
    x
  end

  def taken?(position)
    if @cells[position.to_i-1] == "X" || @cells[position.to_i-1] == "O"
      true
  else
    false
  end
  end

  def valid_move?(move)
    (move.to_i).between?(1, 9) && taken?(move) == false
  end

  def update(position,player)
    if valid_move?(position)
      @cells[position.to_i-1] = player.token
    end
  end
end
