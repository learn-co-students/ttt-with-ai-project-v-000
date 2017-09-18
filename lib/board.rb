class Board
  attr_accessor :board


  def initialize(board)
    @board = board
    reset!
  end




  # Instance Methods #

  def reset!
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    board
  end

  def position
    input = gets.strip
     if input.include?(1...9)

     end

   end

   def update(position, token)








end
