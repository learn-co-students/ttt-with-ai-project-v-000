module Players
    class Computer < Player

    def move(board)
        move = nil
    if array[5].empty?
        return move = "5"
    elsif board.turn_count == 1
        return move = ["1", "3", "7", "9"].sample
    elsif board.turn_count == 2
        return move = ["1", "3", "7", "9"].detect {|i| !board.taken?(i)}.to_s
    elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        return move = "2"
    else
        Game::WIN_COMBINATIONS.detect do |cmb|
        if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
        elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
        end
    end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
    end
    move
    end
end
end
          


#         def move(array)
#             valid_moves = []
#             i = 0
#             until i > 8
#                if array.valid_move?(i) == true
#                  valid_moves << i
#                end
#                 i += 1
#              end
#                 array_high_values = [0, 2, 4, 6, 8]
#                 lesser_moves = [1, 3, 5, 7]
#                 high_value = array_high_values.detect do |value|
#                 valid_moves.include?(value)
#             end

#                 if high_value == nil
#                     low_value = lesser_moves.detect do |value2| valid_moves.include?(value2)
#                   low_value
#                 else
#                     high_value
#                 end
#             end
#         end
#     end
# end

#         def move(array)
#             valid_moves = []
#             i = 0
#             until i > 8
#                 if array.valid_move?(i) == true
#                     valid_moves << i
#                 end
#                 i += 1
#                 end
#         valid_moves.sample.to_s
#     end
#  end
        
#             # class Computer::Easy < Player

        
#     class Computer::Hard < Player

        def move(array)
            valid_moves = []
            i = 0
            until i > 8
               if array.valid_move?(i) == true
                 valid_moves << i
               end
                i += 1
             end
                array_high_values = [0, 2, 4, 6, 8]
                # lesser_moves = [1, 3, 5, 7]
                high_value = array_high_values.detect do |value|
                valid_moves.include?(value)
            end

                if high_value == nil
                    # low_value = lesser_moves.detect do |value2| valid_moves.include?(value2)
                #   low_value
                    else 
                    high_value
                end
            end
        end
    end
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

# #first move always middle (5), check if position is taken
# def move(board)
#   move = nil
# #if middle square is empty, we want to take middle square
#   if array[5].empty?
#     return move = "5"
#   elsif board.turn_count == 1
#     return move = ["1", "3", "7", "9"].sample
#   elsif board.turn_count == 2
# #we want to find the first index that is not taken
#     return move = ["1", "3", "7", "9"].detect {|i| !board.taken?(i)}
# #turn_count 3, then start checking win_combinations and tracking and check if there
# #are two squares
# end
