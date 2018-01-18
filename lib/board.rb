
class Board
  attr_accessor :cells

  def initialize           
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts "\n"      
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

 def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end
  
 def position(input)
    @cells[input.to_i - 1]
  end

  def turn_count
    count = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def taken?(input)
    cell = position(input)
    (cell == "X") || (cell == "O")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end


end

