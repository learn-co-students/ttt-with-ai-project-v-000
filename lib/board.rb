require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    9.times do |i|
      @cells[i] = " "
    end
  end

  def display
    puts "                                            "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "                                            "
  end

  def index(input)
    (input.to_i)-1
  end

  def position(input)
    @cells[index(input)]
  end

  def full?
    @cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    position = @cells[index(input)]
    !(position.nil? || position == " ")
  end

  def valid_move?(input)
    taken?(input) == false && index(input).between?(0,8) && (index(input).is_a? Numeric) == true
  end

  def update(input, player)
    if valid_move?(input.to_i)
      @cells[index(input)] = player.token
   end
  end

end
