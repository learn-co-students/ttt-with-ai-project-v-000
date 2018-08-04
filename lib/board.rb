class Board
   attr_accessor :cells
  def initialize
    @cells = Array.new(9," ")
  end
  def reset!
    self.cells.clear
    self.cells= Array.new(9," ")
  end
  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  def position(user_input)
     index = user_input.to_i - 1
     return @cells[index]
  end
  def full?
    return true if cells.select {|e|e!= " "}.length == 9 #@cells or cells or self.cells all the same
  end
  def turn_count
    return cells.select {|e|e!= " "}.length
  end
  def taken?(user_input)
    return true if cells[user_input.to_i-1] != " " else false
  end
  def valid_move?(user_input)
    index = user_input.to_i-1
    return true if index.between?(0,8) && !taken?(user_input) else false
  end
  def update(user_input,player)
       index = user_input.to_i-1
      #  if valid_move?(user_input)
         @cells[index] = player.token
      #  else
      #  end
  end

end
