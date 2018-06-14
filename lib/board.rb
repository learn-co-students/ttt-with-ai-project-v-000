require 'pry'
class Board

  attr_accessor :cells, :input

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end


def position(input = gets.strip)
  cells[input.to_i - 1]
end


def full?
  cells.none?{|position| position == " "}
end

def turn_count
  counter = 0
cells.each do |turn|
  if turn != " "
  counter += 1
    end
  end
counter
end

def taken?(index)
  if cells[index.to_i - 1] == "X" || cells[index.to_i - 1] == "O"
true
  else cells[index.to_i - 1] == "   " || cells[index.to_i - 1] == " " || cells[index.to_i - 1] == nil
    false
  end
end

def valid_move?(input)
  position = input.to_i - 1
  if position.between?(0,8) && !taken?(input)
    true
  else
    nil
  end
end

def update(input, player)
  input = input.to_i - 1
  cells[input] = player.token


end


end
