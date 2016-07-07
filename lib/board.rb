require 'pry'
class Board

  @cells = []

  def initialize
    self.reset!
  end

  def cells=(argument)
    @cells = argument
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    is_full = true
    @cells.each do |cell|
      if cell == " "
        is_full = false
      end
    end
    is_full
  end

  def turn_count
    count = 0
    @cells.each do |cell|
      if cell != " "
        count += 1
      end
    end
    count
  end

  def taken?(requested_position)
    cell_content = self.position(requested_position)
    if cell_content == "X" || cell_content == "O"
      true
    else
      false
    end
  end

  def valid_move?(requested_position)
    if (1..9).include?(requested_position.to_i) && !taken?(requested_position)
      return true
    else
      return false
    end
  end

  def update(requested_position, player)
    if valid_move?(requested_position)
      @cells[requested_position.to_i - 1] = player.token
    end
  end

end
