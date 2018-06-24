class Board
  attr_accessor :cells 
  
  def initialize
    self.reset! 
  end 

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 

  def self.clone(board)
    new_board = Board.new 
    new_board.cells = board.cells.clone 
    new_board
  end 

  def position(input)
    value = input.to_i - 1
    @cells[value]
  end 


  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != "" && cell != " "
         counter += 1
      end
    end
    counter
  end

  def full?
    turn_count == 9 
  end 
 
  def update(input, player)
    @cells[input.to_i - 1] = player.token 
  end


  def taken?(input)
    position = input.to_i - 1 
    @cells[position] == "X" || @cells[position] == "O"
  end 

  def valid_move?(position)
    position = position.to_i 
    move = position.to_i - 1
    !(taken?(position)) && move.between?(0,8)
  end 

end