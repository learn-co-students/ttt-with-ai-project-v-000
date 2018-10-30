require "pry"

class Board 
  attr_accessor :cells
  
   def initialize(cells = [" "," "," "," "," "," "," "," "," "])
    @cells = cells
    end
  
    def reset!
      if cells != [" "," "," "," "," "," "," "," "," "]
      @cells = [" "," "," "," "," "," "," "," "," "]
     else 
        @cells
      end 
    end 
  
    def display 
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
	    puts "-----------"
	    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
	    puts "-----------"
	    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end 
    
    def position(input)
      @cells[input.to_i - 1]
    end 
  
    def full?
      self.cells.all? {|cell| cell == "X" || cell == "O"}
    end

   def turn_count
      self.cells.count("X") + self.cells.count("O")
    end

    def taken?(position) 
      self.cells[position.to_i - 1] == "X" || self.cells[position.to_i - 1] == "O"
    end

    def valid_move?(position)
      position.to_i > 0 && position.to_i <= 9 && taken?(position) == false
    end

    def update(position, player)
        self.cells[position.to_i-1] = player.token
    end

end




