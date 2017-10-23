class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def reset!
  cells.clear
  cells << [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  cells.flatten!
end

def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}  "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}  "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}  "
end
def full?
cells.all? do |cell|
  if cell == "X" || cell == "O"
    true
  elsif cells.include?("")
  false
  end
end
end

def input_to_index(input)
  input.to_i - 1
end

def position(input)
  input = input_to_index(input)
  cells[input]
end
def turn_count
  count = 0
    cells.each do |cell|
      if cell != " "
        count += 1
      end
end
count
end

def valid_move?(input)
  if input.to_i.between?(1,9) && position(input) == " "
    true
end
end

def taken?(input)
  if position(input) == "X" || position(input) == "O"
      true
    else
      false
end
end


  def update(input, player)

    cells[input.to_i - 1] = player.token


end
end
