class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def full?
    @cells.each do |token|
      if token == " "
        return false
      end
    end
  end

  def turn_count
    counter = 0
    @cells.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(space)
    @cells[space.to_i-1]
  end

  def taken?(position)
    !(@cells[position.to_i - 1].nil? || @cells[position.to_i - 1] == " ")
  end

  def valid_move?(position)
    !taken?(position) && position.to_i.between?(1,9)
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end

  def all_empty?
    self.cells.all? {|cell| cell == " "}
  end

end