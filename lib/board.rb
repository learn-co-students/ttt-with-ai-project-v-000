class Board #represents the data and logic
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def position(input)
    cells[input_to_index(input)]
  end

  def full?
    !@cells.detect{|cell| (cell.nil? || cell == " " || cell == "")}
  end

  def turn_count
    #for each cell in the Cells array, select all cells which are NOT equal to Nil, " ", or "", then count them.
    @cells.select{|cell| !(cell.nil? || cell == " " || cell == "")}.count
  end

  def taken?(input)
    index = input_to_index(input)
    if @cells[index].nil? || @cells[index] == " "
      return false
    else
      return true
    end
  end

  def valid_move?(input)
    input_to_index(input).between?(0,8) && !taken?(input)
  end

  def update(input, player)
    index = input_to_index(input)
    !taken?(input) ? @cells[index] = player.token : nil
  end
end
