class Player::Human < Player
    def move(board)
        puts "Enter a number 1-9:"
        gets.chomp
    end
        
end