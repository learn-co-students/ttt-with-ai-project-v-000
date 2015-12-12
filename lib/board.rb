
class Board

  attr_accessor :cells, :player, :token

  def initialize 
    @cells = Array.new(9, " ")
  end


def reset! #Can reset the state of the board to how it should be at the start of the game an array with 9 " " elements.
  @cells = Array.new(9, " ")
end

def display #Prints the current state of the board. 
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

def position(players_pick) #takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the correct index from the array's perspective.
  self.cells[players_pick.to_i-1]
end

def update(players_pick, player)     #represents updating the board when a player makes a move
  
  self.cells[players_pick.to_i-1] = player.token
end

def full? #True if board is entirely filled with "x/o"s
  !@cells.include?(" ")

end

def turn_count
  move_count = []
  self.cells.each do |cell|
    if cell != " "
      move_count << cell
    end
  end
  move_count.count 
end

def taken?(players_pick) #Returns true or false for an individual position
  position(players_pick) != " "
end

def valid_move?(players_pick) #Ensures that moves are between 1-9 and not taken
  (1..9).include?(players_pick.to_i) && !taken?(players_pick)  
end

#def self.new_state(position, board)
  #new_state = Board.new
  #new_state.cells = board.cells
  #new_state.cells[position.to_i - 1] = game.current_player.token
  #new_state
#end

def available_moves
  open_cells = []
  self.cells.each_with_index do |cell, index|
    if cell == " "
      open_cells << index + 1
    end
  end
  open_cells

end


def current_player
    if turn_count.even?
      player_1
    else
      player_2
    end
  end

end #<--Ends Board 