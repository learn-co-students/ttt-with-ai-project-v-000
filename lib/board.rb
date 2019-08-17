class Board
   attr_accessor :cells

   def initialize(cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
     @cells = cells
   end

   def reset!
     @cells.clear
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
      @cells.all? { |i| i != " " }
   end

   def turn_count
     @cells.count { |i| i != " "}
   end

   def taken?(input)
     @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
   end

   def valid_move?(input)
     input.to_i.between?(1, @cells.length) && !taken?(input)
    end

  def update(position, player)
      @cells[position.to_i-1] = player.token
  end



end
