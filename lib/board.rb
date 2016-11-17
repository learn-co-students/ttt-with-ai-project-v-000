class Board
  attr_accessor :cells

  def initialize
    @cells=Array.new(9," ")
  end
  
  def reset!
    @cells=Array.new(9," ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position s
    cells[s.to_i - 1]
  end

  def full?
    !(@cells.include?(" "))
  end

  def turn_count
    @cells.select{|e| e!=" "}.length 
  end

  def taken? s
    position(s)!=" "
  end

  def valid_move? s
    s.to_i>0&&s.to_i<10&&(! taken?(s))
  end
   
  def update s, player
    if valid_move? s
       @cells[s.to_i-1]=player.token
    end
  end

end

  
