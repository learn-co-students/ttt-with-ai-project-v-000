
module Players 
  class Human < Player 
    def move(new_board) 
      puts "Where would you like to move?"
      position = gets.strip
    end 
  end
end 