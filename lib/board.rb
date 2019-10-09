class Board
  attr_accessor :cells
  def initialize 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def board
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts "  #{@cells[0]} | #{@cells[1]} | #{@cells[2]}  "
    puts "-----------"
    puts "  #{@cells[3]} | #{@cells[4]} | #{@cells[5]}  "
    puts "-----------"
    puts "  #{@cells[6]} | #{@cells[7]} | #{@cells[8]}  "
  end
  
  def position(x)
    y = x.to_i - 1
    @cells[y]
  end
  
  def full?
    @cells.none? (" ")
  end
  
  def turn_count
    #binding.pry 
    counter = [ ]
    self.board.each do |item|
      if item == "X" || "O"
        counter << item 
      end
    end
    counter.length
  end
end