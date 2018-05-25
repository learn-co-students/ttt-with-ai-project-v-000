class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(selection)
    user_selection = selection.to_i
    user_index = user_selection - 1
    cells[user_index]
  end

  def full?
    full_board = 0
    cells.each do |letter|
      if letter == "X" || letter == "O"
        full_board += 1
      else
        full_board += 0
      end
    end
    if full_board == 9
      return true
    else
      return false
    end
  end

  def turn_count
    count = 0
    cells.each do |letter|
      if letter == "X" || letter == "O"
        count += 1
      else
        count += 0
      end
    end
    return count
  end

  def taken?(index)
  user_input = index.to_i - 1
    if cells[user_input] == "X" || cells[user_input] == "O"
     true
    else
     false
    end
  end

  def valid_move?(index)
   user_index = index.to_i - 1
   if user_index.between?(0, 8)
     if @cells[user_index] == " " || @cells[user_index] == "" || @cells[user_index] == nil
       return true
     else
       return false
     end
   else
     return false
   end
  end

  def update(index, player)
   user_index = index.to_i - 1
   cells[user_index] = "X"
  end

end
