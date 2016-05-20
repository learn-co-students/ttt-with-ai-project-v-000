class Board 
  
  attr_accessor :cells
  
  def initialize 
    reset!
  end
  
  def reset!
    self.cells = (Array.new(9, " "))
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
    !cells.include?(" ")
  end
  
  def turn_count 
    9 - turns_left
  end
  
  def turns_left 
    cells.select { |c| c == " " }.count
  end
  
  def taken?(pos)
    position(pos) != " "
  end
  
  def not_taken?(pos)
    position(pos) == " "
  end
  
  def valid_move?(input)
    choices = (1..9).to_a
    if choices.include?(input.to_i) && not_taken?(input)
      true 
    else
      false 
    end
  end
  
  def update(pos, player)
    cells[pos.to_i - 1] = player.token
  end
  
  def cell_value(index)
    cells[index]
  end
  
  def cell_taken?(index)
    cells[index] == "X" || cells[index] == "O"
  end
  
end