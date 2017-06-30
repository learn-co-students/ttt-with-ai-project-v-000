module Players
  class Computer < Player
    
    def move(board)
        move = nil
        msg = "Computer moves to "
        if !board.taken?(5)
             move = "5"
             puts "Computer moves to #{move}."
             move
        elsif !board.taken?(3)
            move = "3"
            puts msg + "#{move}."
            move
        elsif !board.taken?(1)
            move = "1"
            puts msg + "#{move}."
            move
        elsif !board.taken?(9) 
            move = "9"
            puts msg + "#{move}."
            move
         elsif !board.taken?(7) 
            move = "7"
            puts msg + "#{move}."
            move
         elsif !board.taken?(6)
            move = "6"
            puts msg + "#{move}."
            move
        elsif !board.taken?(4)
            move = "4"
            puts msg + "#{move}."
            move
        elsif !board.taken?(2)
            move = "2"
            puts msg + "#{move}."
            move
        end
    end
    
  end
end



 
    
    # def not_center
    #     move = nil
    #         msg = "Computer moves to "
    #         binding.pry
            
    #         # If First Turn Try for corner
    #         if board.turn_count <= 1
    #              move = Game::CORNER_MOVE.sample.to_s
    
    #         # Place 2nd token in the opposite corner from first.
    #         elsif board.turn_count <= 3
    #             move = "1" if board.cells[8] == self.token
    #             move = "9" if board.cells[0] == self.token
    #             move = "3" if board.cells[6] == self.token
    #             move = "7" if board.cells[2] == self.token
            
    #         elsif board.cells[0] == token && board.cells[8] == token && !board.token?("7")
    #             move = "7"
                
    #         elsif board.cells[0] == token && board.cells[8] == token && !board.token?("3")
    #             move = "3"
                
    #         elsif board.cells[2] == token && board.cells[6] == token && !board.token?("1")    
    #             move = "1"
                
    #         elsif board.cells[2] == token && board.cells[6] == token && !board.token?("9")    
    #             move = "9"    
                
             
    #         end
            
    #         puts msg + "#{move}."
    #         move
    # end