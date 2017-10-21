class Board

  attr_accessor :cells, :token 

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} " 
   puts "-----------" 
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} " 
   puts "-----------" 
   puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} " 
  end

  def position(index)
    index = index.to_i - 1 
    @cells[index]
  end

  def full?
    @cells.none? { |el| el == " "}
  end

  def turn_count 
    @cells.count { |el| el.match(/[XO]/) }
  end

  def taken?(board_spot)
    position(board_spot).match(/[XO]/) ? true :false
  end

  def valid_move?(string)
    return true if position(string.to_i) == " " && string.match(/[1-9]/)
    false
  end

  def update(board_spot, player)
    index = board_spot.to_i - 1 
    @cells[index] = player.token
  end





end