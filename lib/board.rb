class Board

  attr_accessor :cells

  def initialize()
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def full?
    cells.all?{|cell| cell == "X" || cell == "O"}
  end
  #if all cells are full then return true
  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end
  #if theres an x or o , count it

  def taken?(user_input)
     !(position(user_input) == "" || position(user_input) == " ")
    end

    #if the positions are not empty, then it is taken (true)

   def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input)
     #returns true if the user input is between 1-9 and if its not taken
   end

   def update(user_input, player)
       cells[user_input.to_i-1] = player.token
   end
   #updates the cells to player token,according to the input, which has to be an integer between 1 -9. 

end
