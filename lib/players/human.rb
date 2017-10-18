module Players #Ruby recognizes that there is only one Players module, even though it is split across different files.
  class Human < Player

    def move(array)
      puts "Please make a move (enter 1-9)"
      gets.strip
    end

  end
end
