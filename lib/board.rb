class Board 
  
  attr_accessor :cells
  @@all = []
  
  def initialize
    @board = Array.new(9, " ")
    @@all << @board
  end
  
  # def cells
  
  # end
  
  
end