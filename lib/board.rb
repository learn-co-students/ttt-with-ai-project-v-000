require "pry"
class Board
  attr_accessor :cells
  def initialize(board=nil)
    @cells= Array.new(9," ")
  end
  def reset!
    @cells= [" "," "," "," "," "," "," "," "," "]
  end


def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

# code your input_to_index and move method here!
def input_to_index(input)
  int=input.to_i
  return index= int - 1
end

def update(input,player)
  index= self.input_to_index(input)
  @cells[index]=player.token
  @cells
end


def taken?(input)
  index= self.input_to_index(input)
  if @cells[index.to_i]==" "||@cells[index.to_i]==""|| @cells[index.to_i]== nil
    return false
  else
    return true
  end
end
def position(input)
  index= self.input_to_index(input)
  @cells[index]
end



def valid_move?(input)
  index= input_to_index(input)
  if taken?(input) == false && index.between?(0,8)
    return true
  else
    return false
  end
end
def turn_count
  counter = 0
  @cells.each do |index|
    if index== "X" || index== "O"
      counter += 1
    end
  end
  return counter
    binding.pry
end




# def position_taken?(index)
#   !(@cells[index].nil? || @cells[index] == " ")
# end


def won?
  WIN_COMBINATIONS.each do |combination|
    index1=combination[0]
    index2=combination[1]
    index3=combination[2]

    if @cells[index1]=="X" && @cells[index3]=="X" && @cells[index2]=="X"
        return combination

    elsif @cells[index1]=="O" && @cells[index3]=="O" && @cells[index2]=="O"
        return combination
    end
  end
  return false
end

def full?

  @cells.all? do |index|
    index=="X"||index=="O"

  end
end








end
