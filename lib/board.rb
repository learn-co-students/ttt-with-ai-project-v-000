class Board
attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    initialize
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    index = (user_input.to_i) - 1
    return "#{@cells[index]}"
  end

  def full?
    @cells.none? {|index| index == " "}
  end

  def turn_count
  counter = 0
    @cells.each do |index|
      if index != " "
        counter += 1
      end
    end
  return counter
  end

  def taken?(user_input)
    index = (user_input.to_i) - 1
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
      return false
    else
      return true
    end
  end
  
end
