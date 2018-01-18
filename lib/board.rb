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

  def position(index)
    @cells[valid_index(index)]
  end

  def full?
    @cells.all? {|cell| cell != " "}
    end

  def turn_count
    @cells.select { |cell| cell == "O" || cell == "X"}.size
  end

  def taken?(index)
    if @cells[valid_index(index)] == "O" || @cells[valid_index(index)] == "X"
      true
    else
      false
    end
  end

  def valid_index(index)
    if index.is_a? String
      index = index.to_i - 1
    else
      index
    end
  end

  def valid_move?(index)
    if (valid_index(index) >= 0 && valid_index(index) < 9) && !taken?(valid_index(index))
      true
    else
      puts "Not a valid input! Try again: "
      false
    end
  end

  def update(index, player)
    @cells[valid_index(index)] = player.token
  end
end
