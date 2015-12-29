class Board
  attr_accessor :cells
  
  def initialize(cells = [" "," "," "," "," "," "," "," "," "]) #initializes a board with all empty cells
    @cells =  cells
  end
  
  def reset! #resets any cells to empty
    @cells = [" "," "," "," "," "," "," "," "," "]   
    return @cells
  end
  
  def display #displays the values in each cell in a 3x3 matrix format
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "    
  end

  def position(cell_number)  #given a cell number the method returns the value at that cell
    return @cells[cell_number.to_i-1]
  end

  def full?    #checks if the board is full by checking for empty cells
    if @cells.any?{|cell| cell==" "}
      return false 
    else 
      return true 
    end
  end
  
  def turn_count #counts the number of turns by counting the number of positions occupied on the board
    count=0
    @cells.each do |cell|
      if cell != " "
        count +=1
      end
    end
    return count      
  end

  def taken?(cell_position) # given the cell number, checks if that position is occupied or not
    if @cells[cell_position.to_i-1] == " " || @cells[cell_position.to_i-1] == ""
      return false
    else
      return true
    end
  end

  def valid_move?(cell_position) #given the cell number, checks if a move can be made into the cell depends on taken? method
    cell_position = cell_position.to_i
    if cell_position.between?(1,9) && !taken?(cell_position)
      return true
    else
      return false
    end
  end

  def update(cell_position, player) #updates the board with the cell position and the value of the token
    @cells[cell_position.to_i-1] = player.token
    return self.position(cell_position)
  end
  
end