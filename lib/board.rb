class Board

  attr_accessor :cells

  def initialize(cells = nil)
    @cells = Array.new(9, " ")  
  end

  def reset!
    initialize.clear
    initialize
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n"
    puts "\n"
  end

  def position(position)
    @cells[position.to_i-1]
  end

  def full?
    @cells.all? do |char|
      char == "X" || char == "O"
    end
  end

  def turn_count
    @cells.count do |count|
      count == "X" || count == "O"
    end
  end

  def taken?(char)
    position(char) == "X" || position(char) == "O" ? true : false
  end

  def valid_move?(position)
    !self.taken?(position) && position.to_i.between?(1,9)
  end

  def update(position, player)
    @cells[position.to_i-1] = player.token
  end


end
