class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    self.display
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
    new_input = input.to_i - 1
    @cells[new_input]
  end

  def full?
    if !@cells.any? {|cell| cell == " "}
      return true
    end
  end

  def turn_count
    @cells.count {|cell| cell != " "}
  end

  def taken?(input)
    input = input.to_i - 1
    if @cells[input] != " "
      return true
    else
      false
    end
  end

  def valid_move?(input)
    new_input = input.to_i
    if !taken?(input)
      if new_input >= 1 && new_input <= 9
        return true
      end
    else
      false
    end
  end

  def update(input, player)
    new_input = input.to_i - 1
    @cells[new_input] = "#{player.token}"

  end
end
