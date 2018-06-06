require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #binding.pry
  end

  def reset!
    @cells.clear
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
    input = input.to_i - 1
    @cells[input]
    #binding.pry
  end

  def full?
    @cells.all?{|input| input == "X" || input == "O" }
  end

  def turn_count
    @cells.count{|c| c != " " }
  end

  def taken?(input)
    input = input.to_i - 1
    @cells[input] != " "
  end

  def valid_move?(input)
    @input = input.to_i
    @input.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    player = "X" || "O"
    if valid_move?(input)
        input == player
        puts input
    end
    display
  end

end
