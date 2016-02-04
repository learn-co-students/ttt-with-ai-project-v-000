class Computer < Player
  #  Implement a #move method that accepts a board and returns the move the computer wants to make in the form of a 1-9 string. How the computer decides to make that move is up to you but it must be capable of returning a valid move at some point.

  def move(board)
    puts "Computer player #{token} moved"
    # analyze board
    puts "#{@board}"
    # min/max algorithm??
    # @player_move = []

    # def minimax
    #   @score = 0

    # end

    # random number 1-9 passes test
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    

  end

end