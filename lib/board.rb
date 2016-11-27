require 'pry'
class Board
  attr_accessor :cells, :board, :token

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    "#{@cells[position.to_i-1]}"
  end

  def full?
    @cells.all?{|positions| positions == "X" || positions == "O"}
  end

  def turn_count
    @cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(input)
    if self.position(input) == "X" || self.position(input) == "O"
      true
    else
      false
    end
  end

  def valid_move?( input)
    input = input.to_i
    input.between?(1,9) && !self.taken?(input)
  end

  def update(input, :token => "X")
    binding.pry
    @cells[input.to_i-1]
  end

  def update(input, player)
    @board[input.to_i-1] = player.token
  end

end
