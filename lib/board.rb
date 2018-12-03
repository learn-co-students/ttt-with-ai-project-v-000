class Board
  
  attr_accessor :cells
  
  def initialize
    reset!
  end
  
  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(user_input)
    self.cells[user_input.to_i - 1]
  end
  
  def full?
    self.cells.each do |cell|
      if cell === "X" or cell === "O"
        TRUE
      else
        FALSE
        break
      end
    end
  end
  
  def turn_count
    turns = []
    self.cells.each do |cell|
      if cell === "X" or cell === "O"
        turns.push(cell)
      end
    end
    turns.length
  end
  
  def taken?(user_input)
    if self.cells[user_input.to_i - 1] === "X" or self.cells[user_input.to_i - 1] === "O"
      TRUE
    else
      FALSE
    end
  end
  
  def valid_move?(user_input)
    if taken?(user_input) === FALSE && user_input.to_i > 0 && user_input.to_i < 10
      TRUE
    end
  end
  
  def update(user_input,player)
    self.cells[user_input.to_i - 1] = player.token
  end
    

end