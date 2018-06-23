class Board
attr_accessor :cells
 

  def initialize
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end


  def display
    s = self.cells
    puts " #{s[0]} | #{s[1]} | #{s[2]} "
    puts "-----------"
    puts " #{s[3]} | #{s[4]} | #{s[5]} "
    puts "-----------"
    puts " #{s[6]} | #{s[7]} | #{s[8]} "
  end

  def position(spot)
    spot = spot.to_i - 1
    s = self.cells
    s[spot]
  end

  def full?
   not_full = self.cells.any? {|cell| cell == " "}
   return !not_full
   
  end

  def turn_count
    count = 0
    self.cells.each do |cell|
      if cell == "X" || cell == "O" 
        count += 1
      end
    end
    return count
  end


  def taken?(cell)
    new_cell = cell.to_i - 1
     if self.cells[new_cell] == "X" ||  self.cells[new_cell] == "O"
      true
     else 
      false
     end
  end

  def valid_move?(move)
    if move.to_i > 0 && self.taken?(move) == false 
      true
    else 
      false
    end
  end

  def update(move,player)
    self.cells[move.to_i - 1] = player.token
  end



end