class Board
  attr_accessor :cells
  
  def initialize()
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    !@cells.include?(" ")
  end
  
  def turn_count
    turn = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        turn += 1
      end
    end
    turn
  end
  
  def taken?(input)
    if position(input) == " "
      return false
    end
    return true
  end
  
  def valid_move?(input)
    if input.to_i < 1 || input.to_i > 9
      return false
    end
    if taken?(input)
      return false
    end
    return true
  end
  
  def update(input, player)
    if valid_move?(input)
      @cells[input.to_i - 1] = player.token
    end
  end  

end