class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(a)
    p = a.to_i - 1
    @cells[p]
  end

  def full?
    !@cells.any?{|element| element == nil || element == "" || element == " "}
  end

  def turn_count
    count = 0
    @cells.each do |index|
      if index != "" && index != " " && index != nil
        count +=1
      end
    end
    return count
  end

  def taken?(index)
    index = index.to_i - 1
    if @cells[index] == "" || @cells[index] == " " || @cells[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !self.taken?(index)
  end

  def update(index, value)
    index = index.to_i - 1
    @cells[index]= value
  end

end
