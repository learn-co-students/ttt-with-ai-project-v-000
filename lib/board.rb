class Board

  attr_accessor :cells

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

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end

  def full?
    @cells.none?{|index|  index.nil? || index == " "}
  end

  def turn_count
    counter = 0
    @cells.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(input) #returns true if there is a X or O at index, false if it's empty
    index = input.to_i - 1
    !(@cells[index].nil? || @cells[index] == " ")
  end

  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && !taken?(input)
  end

end
