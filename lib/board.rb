class Board

  attr_accessor :cells

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
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   puts "\n \n"
 end

  def position(position_choice)
    @cells[position_choice.to_i - 1]
  end

 def full?
   !@cells.include?(" ")
 end

 def turn_count
   9 - @cells.count(" ")
 end

 def taken?(position_choice)
   @cells[position_choice.to_i - 1] != " "
 end

 def valid_move?(position_choice)
   (1..9).include?(position_choice.to_i) && !taken?(position_choice)
 end

 def update(position_choice, player)
   @cells[position_choice.to_i - 1] = player.token
 end

end