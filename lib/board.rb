class Board
   attr_accessor :cells

   def initialize
      @cells = Array.new(9, ' ')
   end

   def reset!
      @cells = Array.new(9, ' ')
   end

   def display
      puts "\n"
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts '-----------'
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts '-----------'
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
      puts "\n"
   end

   # Returns "X" or "O"
   def position(input)
      @cells[to_index(input)]
   end

   def full?
      @cells.all? { |token| token == 'X' || token == 'O' }
   end

   def turn_count
      @cells.count { |token| token == 'X' || token == 'O' }
   end

   def taken?(input)
      @cells[to_index(input)] != ' ' && (@cells[to_index(input)] == 'X' || @cells[to_index(input)] == 'O') ? true : false
   end

   def valid_move?(input)
      input.to_i.between?(1, 9) && !taken?(input)
   end

   def update(input, player)
      @cells[to_index(input)] = player.token
   end

   def to_index(input)
      input.to_i - 1
   end
end
