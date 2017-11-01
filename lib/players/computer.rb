module Players
  class Computer < Player
    def move(board)
      computer_move = nil
      if !board.taken?(5)
        computer_move = 5
      end
      corners = [1, 3, 7, 9]
      corners.detect do |corner|
       if board.valid_move?(corner)
         computer_move = corner
       elsif !board.valid_move?(corner)
           new_move = (1 + rand(8))
           if board.valid_move?(new_move)
             computer_move = new_move
           end
         end
       end
       computer_move.to_s
     end
   end
 end
