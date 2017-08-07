module Players
  class Human < Player

    # the (board) here doesn't really do anything
    # it is just setup this way so it matches the
    # << class Computer >> where the (board) is in
    # fact used to see if the actual board has
    # certain cells occupied at certain points in
    # the game
    def move(board)
      puts "Please enter a number between 1 and 9"
      gets.strip
    end
  end
end
