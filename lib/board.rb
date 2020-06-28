require 'pry'

class Board
  attr_accessor :cells


  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ") #array is a class here so .clear doesn't work
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]

  end

  def full?
    cells.all? do |a| a == "X" || a == "O"
    end
  end

  def turn_count
    cells.count do |c| c == "X" || c == "O"
    end
  end

  def taken?(input)
    x = position(input)
    if x == "X" || x == "O"
      true
    else false
    end
  end

  def valid_move?(input)
    if input.to_i.between?(1, 9) && taken?(input) == false
      true
    else false
    end
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token

  end



end





# class Board
#   attr_accessor :cells
#
#   def initialize
#     reset!
#   end
#
#   def reset!
#     @cells = Array.new(9, " ")
#   end
#
#   def display
#     puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
#     puts "-----------"
#     puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
#     puts "-----------"
#     puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
#   end
#
#   def position(input)
#     index = input.to_i - 1
#     cells[index]
#   end
#
#   def full?
#     @cells.all? do |token|
#       token == "X" || token == "O"
#     end
#   end
#
#   def turn_count
#     counter = 0
#     @cells.each do |token|
#       if (token == "X" || token == "O")
#         counter += 1
#       end
#     end
#     counter
#   end
#
#   def taken?(input)
#     position(input) == "X" || position(input) == "O"
#   end
#
#   def valid_move?(input)
#     !taken?(input) && input.to_i >= 1 && input.to_i <= 9
#   end
#
#   def update(input, player)
#     @cells[input.to_i - 1] = player.token
#   end
# end
