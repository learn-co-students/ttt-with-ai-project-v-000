class Board
  attr_accessor :cells
  
  def initialize
    self.reset!
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
  
  def position(input)
    cells[input.to_i - 1]
  end
  
  def full?
    cells.all? {|cell| cell != " "}
  end
  
  def turn_count
    cells.count { |cell| cell == "X" || cell == "O" }
  end
  
  def taken?(input)
    if cells[input.to_i - 1] == " " || cells[input.to_i - 1] == "" || cells[input.to_i - 1] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(input)
    if input.to_i.between?(1,9)
      if taken?(input) == false
        return true
      else
        return false
      end
    else
      return false
    end
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
  
end