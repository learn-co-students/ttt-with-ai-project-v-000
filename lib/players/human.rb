module Players
  class Human < Player

    def move(board=nil)
      puts "Choose your position by selecting any number between 1-9.\n
      Where would you like to move?"
      input = gets.strip
      input
    end
  end
end
