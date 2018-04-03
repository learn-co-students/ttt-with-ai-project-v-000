class Board
  attr_accessor :cells, :turn_count
  #@cells = []
def initialize
  @cells = Array.new(9, " ")
end

def cells
  @cells
end

def reset!
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

#def input_to_index(input)
  #input.to_i - 1
#end
#def position(input)
  #@cells[input_to_index(input)]
#end

def position(input)
  position = input.to_i - 1
  @cells[position]
end

  def full?
    @cells.none? do |space|
      if space == " "
        true
      else
        false
      end #ends if/else
  end #ends block code
end #ends full? method

def turn_count
  @cells.count {|c| c == "X" || c == "O"}
end

def taken?(move)
  if @cells[move.to_i - 1] == "X" || @cells[move.to_i - 1] == "O"
    true
  else
    false
  end
end

  def valid_move?(move)
    move_taken = move.to_i
    if move_taken.between?(1, 9) && taken?(move_taken) == false
     true
   else
     false
   end
end

def update(move, player)
  move_taken = move.to_i - 1
  @cells[move_taken] = player.token
end



end
