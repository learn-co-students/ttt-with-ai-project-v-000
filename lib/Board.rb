class Board
  attr_accessor :cells
 def initialize
   @cells =  Array.new(9, " ")
 end

 def reset!
   @cells = Array.new(9, " ")
   @cells
 end
 def index(som)
   som.to_i - 1
 end
 def display
   puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
   puts "------------"
   puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
   puts "------------"
   puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
 end
 def position(pos)
   cells[pos.to_i - 1]
 end
 def full?
   cells.all? do |token|
     token == "O" || token == "X"
   end
 end
 def turn_count
   i = 0
   cells.each do |token| if token == "O" || token == "X"
     i+=1
              end
      end
      i
 end
 def taken?(num)
   cells[index(num)] == "X" || cells[index(num)] == "O"
 end
 def valid_move?(num)
   index(num).between?(0,8) && !taken?(num)
 end
  def update(num,player)
    cells[index(num)] = player.token
  end
end
