class Board

  attr_accessor :cells, :token

  def initialize
    reset!
  end

  def cells
    @cells
  end

  def reset!
    self.cells=(Array.new(9, " "))
  end

 def display #shows current state
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
 end

  def position(user_input) #takes uers input inform of 1-9
    @cells[user_input.to_i - 1]
  end

  def full?
    if cells.include?(" ")
    false
  else
    true
  end
  end

  def turn_count
  counter = 0
  cells.each do |turns|
    if turns == "X" || turns == "O"
      counter += 1
    end
  end
  counter
end

  def taken?(user_input)
    if position(user_input) == "X" || position(user_input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1, 9) && !taken?(user_input)
  end

    def update(user_input, player)
      @cells[user_input.to_i - 1] = player.token 
    end
  #def valid_move?(position) # returns true for 1-9 that is not taken
  #new_position = input_to_index(position)
  #new_position.between?(0,8) && !taken?(new_position)
#end
#def input_to_index(user_input)
#   user_input.to_i - 1
# end





#  def full?
#    if @@board.include?(" ")
#      false
#    else
#      true
#    end
#  end #ends full



end #ends class
