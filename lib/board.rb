class Board
attr_accessor :cells

def initialize
  reset!
end

def reset!
  @cells = Array.new(9," ")
end

def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end


def position(input)
  cells[input.to_i-1]
end


def full?
  @cells.all?{|space| space == "X" || space == "O"}
end



def turn_count
  counter = 0
  @cells.each do |space|
    if space == "X" || space == "O"
    counter += 1
    end
  end
counter
end

def taken?(index)
  @cells[index.to_i - 1] != " " && @cells[index.to_i - 1] != ""
end


def valid_move?(index)
  (index.to_i - 1).between?(0,8) && !taken?(index)
end

def update(input, player)
  cells[input.to_i - 1] = player.token
end

######class end below#######
end
