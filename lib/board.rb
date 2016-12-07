class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(cell)
    get_cell = cell.to_i - 1
    @cells[get_cell]
  end

  def full?
    if @cells.include?(" ") then
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
    @cells.each do |contents|
      if contents != ' '
        counter += 1
      end
    end
    return counter
  end

  def taken?(location)
    location = location.to_i - 1
    !(@cells[location].nil? || @cells[location] == " ")
  end

  def valid_move?(location)
    location = location.to_i
    if ((taken?(location)) || !(location.between?(1,9)))
      false
    else
      true
    end
  end

  def update(index, player)
    index = index.to_i - 1
    @cells[index] = player.token
  end

end
