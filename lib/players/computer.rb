module Players
    class Computer < Player

        def move(board)
            valid_moves = []
            i = 0
            until i > 8
                if board.valid_move?(i) == true
                    valid_moves << i
                end
                i += 1
                end
            valid_moves.sample.to_s
            end
        end
    end
        
            # class Computer::Easy < Player

        
    # class Computer::Hard < Player

    #     def move(array)
    #         valid_moves = []
    #         i = 0
    #         until i > 8
    #            if array.valid_move?(i) == true
    #              valid_moves << i
    #            end
    #             i += 1
    #          end
    #             array_high_values = [0, 2, 4, 6, 8]
    #             lesser_moves = [1, 3, 5, 7]
    #             high_value = array_high_values.detect do |value|
    #             valid_moves.include?(value)
    #         end

    #             if high_value == nil
    #                 lesser_moves = [1, 3, 5, 7]
    #             else
    #                 high_value
    #             end
            # end
        # end
    # end
end

              
    
    
# #     def move(array)
# #         valid_moves = []

# #         until i > 8
# #             if array.valid_move?(i) == true
# #                 valid_moves << i
# #             end
# #             i += 1
# #             end
# #             valid_moves.sample.to_s
# #         end
# #     end

        
# # class Computer::Hard < Player

# #     def move(array)
# #     valid_moves = []
# #     i = 0

# #     if array.valid_move?(i) == true
# #         valid_moves << i
# #     end
# #     i += 1
# #     end
# #     high_value_moves = [0, 2, 4, 6, 8]
# #     lesser_moves = [1, 3, 5, 7]
# #     high_value_move_variable = high_value_moves.detect do |value| valid_moves.include?(value)
# #         if high_value_move_variable = nil


# #         else 
# #             high_value_move_variable
# #         end
# #         end
# #     end

#     def move(board)

#             @i = 0
#             random_spot(board)
#             best_spots(board)
#             block_a_combo(board)
#             for_the_win(board)
#             "#{@i + 1}"
#         end

#         def for_the_win(board)
#             WIN_COMBINATIONS.each do |combo|
#                 if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " " && board.cells[combo[0]] == self.token
#                     @i = combo[2]
#                 elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " " && board.cells[combo[0]] == self.token
#                     @i = combo[0]
#                 elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " " && board.cells[combo[0]] == self.token
#                     @i = combo[1]
#                 else
#                     nil
#                 end
#             end
#             end

#         def block_a_combo(board)
#             WIN_COMBINATIONS.each do |combo|
#                 if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " " && board.cells[combo[0]] != " "
#                     @i = combo[2]
#                 elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " " && board.cells[combo[0]] != " "
#                     @i = combo[0]
#                 elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " " && board.cells[combo[0]] != " "
#                     @i = combo[1]
#                 else
#                     nil
#                 end
#             end
#         end
        
#         def best_spots(board)
#             shuffled_array = [0, 2, 4, 6, 8].shuffle
#             shuffled_array.any? do |i|
#                 if board.cells[i] == " "
#                     @i = i
#                 else
#                     nil
#                 end
#             end
#         end
        
#         def random_spot(board)
#             play = [1, 3, 5, 7].sample
#             if board.cells[play] == " "
#                 @i = play
#             else
#                 random_spot(board)
#             end
#         end
#     end
# end

            # human player 1 X moves
            # computer O moves based on conditions of win_combinations

            # 0 player 
            # computer X moves randomly
            # computer O moves based on conditions of win_combinations

                    # attr_accessor :player_1, :player_2, :board
        
        # WIN_COMBINATIONS = [
        #     [0,1,2], 
        #     [3,4,5], 
        #     [6,7,8],  
        #     [0,3,6],  
        #     [1,4,7],  
        #     [2,5,8], 
        #     [0,4,8],  
        #     [2,4,6]  
        #   ]

