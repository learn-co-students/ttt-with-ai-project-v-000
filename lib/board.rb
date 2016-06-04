class Board
  include SharingIsCaring
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index_string)
     i = input_to_index(index_string)
    @cells[i]
  end

  def full?
    !@cells.detect {|cell| cell == " "}
  end

  def turn_count
    turns = 0
    @cells.each do |cell|
      turns += 1 unless cell == " "
    end
    turns
  end
  

  def taken?(i)
   i = i.to_i - 1
    @cells[i] == "X" || @cells[i] == "O" ? true : false
  end


  def update(index_string, player)
    i = index_string.to_i - 1
    @cells[i] = player.token
  end

  def valid_move?(move)
    i = move.to_i - 1  
    i.between?(0,8) && !(taken?(move))
  end

end