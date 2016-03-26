require 'pry'

class Board
  attr_accessor :cells, :board

  def initialize
    # @board= @cells
    @cells= Array.new(9, " ")
  end

  def reset!
    @cells= Array.new(9, " ")
  end

  def display
    puts "\n"
    puts "\n"
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "\n"
    puts "\n"
  end

  def position(input)
    @cells[input.to_i - 1 ]
  end

  def full?
     @cells.include?(" " ||"") ? false : true
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if cell != " "
        count +=1
      end
    end
    count
  end

  def taken?(input)
    @cells[input.to_i - 1] != " " ? true : false
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !taken?(position)
  end

  def update(input, player)
    if turn_count.even?
    @cells[input.to_i-1] = "X"
    else
      @cells[input.to_i-1] = "O"
    end
  end

end