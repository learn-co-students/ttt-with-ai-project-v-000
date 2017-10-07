require 'pry'

class Board
  attr_accessor :cells

  def reset!
   @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "

  end

  def position(input)
    #puts "Please enter 1-9:"
    #input = gets.strip
    cells[input.to_i - 1]
  end

  def full?
    cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    counter = 0
    cells.each do |pos|
    if pos == "X" || pos == "O"
        counter += 1
      end
    end
    counter
    #solution
    #cells.count{|token| token == "X" || token == "O"}
  end


  def taken?(input)
    loc = input.to_i - 1
    cells[loc] == "X" || cells[loc] == "O"
    #solution
    #!(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
    #binding.pry
  end
end #ends Board
