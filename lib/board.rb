class Board
  attr_accessor :cells, :player, :game
  
  def initialize  
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  # Displays current instance of board variable
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    position = input.to_i-1
    @cells[position]
  end

  def update(input, player)
    position = input.to_i-1
    @cells[position] = player.token
  end

 # Finally, a board can return values based on its state such as
  def full?
    @cells.all?{|i| i == "X" || i == "O"}
  end

  def turn_count
    #turn_count based on how many positions in the cells array are filled.
    @cells.count{ |v| v == "X" || v == "O" }
  end

  def taken?(position)
    position = position.to_i-1
    #taken? will return true or false for an individual position. 
    if @cells[position] == "X" || @cells[position] == "O" 
     true 
    elsif @cells[position] == " " || @cells[position] = "" || @cells[position] = "  "
      false
    end
  end

  def valid_move?(input) 
   #valid_move? will ensure that moves are between 1-9 and not taken
   taken?(input) == false && (input.to_i-1).between?(0,8)    
  end

end