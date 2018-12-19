module Players 
  class Human < Player
  include 
    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end
  end
end