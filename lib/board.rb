class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    cells[position.to_i-1]
  end

  def full?
    full = cells.include?(" ")
    !full
  end

  def turn_count
    counter = 0
    cells.each do |p|
      if p != " "
        counter += 1
      end
    end
    counter
  end

  def taken?(location)
    cells[location.to_i-1] != " " && cells[location.to_i-1] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(location, player = 'X')
    cells[location.to_i-1] = 'X'
    # TODO: this ain't right yo
  end

end

