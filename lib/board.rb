class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  def display
    puts ""
    puts ""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
    puts ""
  end


  def position(input)
    input = input.to_i - 1
    @cells[input]
  end


  def full?
    if @cells.include?(" ")
      return false
    else true
    end
  end



  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(location)
    location = location.to_i - 1
    @cells[location] != " "
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(location, player)
    location = location.to_i - 1
    @cells[location] = player.token
  end


end