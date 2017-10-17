class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(value)
   return @cells[value.to_i - 1]
  end

  def full?
   if @cells.include?(" ") || @cells.include?("") || @cells.include?(nil)
     false
   else
     true
   end
  end

  def turn_count
   i = 1
   count = 0
   9.times do
      if taken?(i) == true
        count = count + 1
      end
      i = i + 1
   end
   count
  end

  def taken?(value)
   value = value.to_i - 1
   if @cells[value] == "X" || @cells[value] == "O"
     return true
   else
     return false
   end
  end

  def valid_move?(index)
   new_index = index.to_i - 1
   if (taken?(index) == false && new_index.between?(0, 8))
    true
   else
    false
   end
  end

  def position_taken?(index)
    !(@cells[index.to_i].nil? || @cells[index.to_i] == " ")
  end

  def update(space, player)
    @cells[space.to_i - 1] = player.token
  end
end
