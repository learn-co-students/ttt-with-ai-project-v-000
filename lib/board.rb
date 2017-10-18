class Board
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.all? {|x| x != " "}
  end

  def turn_count
    # @cells.collect {|x| x == " "}.size / 3
    @cells.count {|token| token == "X" || token == "O"}
  end

  # I'm going to expand on this to insert some reply text.
  # def taken?(position)
  #   cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
  # end

  def taken?(position)
    x = cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
    if x == true
      puts "This spot is already taken!"
      return true
    else x == false
      return false
    end
  end

  def valid_move?(position)
    !(taken?(position))  && (0..8).include?(position.to_i - 1)
  end

#  This one won't work because you
#  can't just define the token as "X"
#  when it could be "X" or "O"

#  def update(position, token)
#    token = "X"
#    cells[position.to_i - 1] = token
#    display
#  end

#  This is the GitHub answer
   def update(input, player)
     cells[input.to_i-1] = player.token
   end
end
