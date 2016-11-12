class Board
  attr_writer :cells

  def cells
    @cells =  []
  end

  def reset!
    @cells.clear
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(take)
    take = gets.chomp
    @cells["#{take.to_i - 1}"]
    display
  end

  def full?
    (@cells.all? { |turn| (turn == "X" || turn == "O") }) ? true : false
  end

  def turn_count
    counter = 0
    @cells.each { |turn| counter += 1 if turn == "X" || turn == "O" }
    counter
  end

  def taken?(index)
    if (@this[index.to_i - 1] != " " || nil)
      true
    else
      false
    end
  end

  def valid_move?(index)
    if (index.to_i.between?(1, 9) && (@this[index.to_i - 1] == " " || @this[index.to_i - 1] == nil))
      true
    else
      false
    end
  end

  def update(index, player)
    if index.to_i % 2 == 0 || turn_count.even? == true
      player = "O"
    else
      player = "X"
    end
  end
end
