
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

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    counter = 0
    full = ""
    until counter > 8 do
      if cells[counter] == " "
        full = false
      end
      counter+=1
    end
    if !full == false
      true
    end
  end

  def turn_count
    turn = 0
    self.cells.each do |marker|
      if marker == "X" || marker == "O"
        turn += 1
      end
    end
    turn
  end

  def taken?(input)
    if cells[input.to_i - 1] == "X" || cells[input.to_i - 1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    input = input.to_i
    if input > 0 && input <= 9
      if taken?(input) == false
        true
      else
        false
      end
    else
      false
    end
  end

  def update(input, player)
    if valid_move?(input)
    cells[input.to_i - 1] = player.token
    else
  end
  end

end
