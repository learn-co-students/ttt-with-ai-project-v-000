require_relative "../player.rb"

class Human < Player
  
    def move(board)
        puts " #{@name}, what is your next move?"
        return response=gets.chomp
    end
    
end