
module Players 
class Computer < Player
#   attr_accessor :board, :cells  
#   WIN_COMBINATIONS = 
# [[0, 1, 2],
# [3, 4, 5], 
# [6, 7, 8], 
# [0, 3, 6], 
# [1, 4, 7],
# [2, 5, 8],
# [0, 4, 8],
# [2, 4, 6]] 

# WINNING_PRIORITIES = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

# def move(board)
#         winning_move(board) || random_move(board)
         
# end
 
# def winning_move(board)
#   next_space = []
 
#         WIN_COMBINATIONS.map do |space|
#           WINNING_PRIORITIES.map do |priority|
#           
#             if (board.cells[space[priority[0]]] == @token) && (@board.cells[space[priority[1]]] == @token)
#               next_space =  space[priority[2]]
#               if board.cells[next_space] == " "
#                 return next_space.to_s
                 
#             end
#             end
#           end
#         return nil
#         end
# end 
      
      def move(board)
       
        answer = rand(1...9)
        
        until board.valid_move?(answer)
            answer  = rand(1...9)
         end 
         answer.to_s 
      end

end 
end 




