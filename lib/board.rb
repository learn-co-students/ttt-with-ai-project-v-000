class Board
  
  attr_accessor :cells, :player, :game
  
  def initialize
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
  
  def position(cell_number)
    @cells[cell_number.to_i - 1]
  end
  
  def full?
    @cells.all? {| element | element == "X" || element == "O"}
  end
  
  def turn_count
    counter = 0
    @cells.each do |position|
      if position == "X"
        counter += 1
      elsif position == "O"
        counter += 1
      end
    end
    counter
  end
  
  def taken?(cell_number)
    position(cell_number) != " "
  end
  
  def valid_move?(cell_number)
    index_number = cell_number.to_i
    index_number.between?(1, 9) && !(taken?(index_number))
  end
  
  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end
  
end