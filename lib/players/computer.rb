class Player::Computer < Player

    OPTIONS = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    def move(board)  
      OPTIONS.each do |string|
        
        next if board.taken?(board.position(string))

        if board.valid_move?(string)
          return string 
        end
      end
    end 
    
end