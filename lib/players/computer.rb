require 'pry'

module Players
    class Computer < Player

      attr_reader :board


          def move(board)
                valid_moves = [ ]  # array of valid moves
                board.cells.each.with_index  do |cell, index| #cycle through each item of cells array
                  position = (index + 1).to_s # convert item index to board position string
                    if board.valid_move?(position) # call valid_move method and pass in the board position
                      valid_moves << position # add position number to valid_moves array if valid move metod evaluates to true
                    end # end of if statement
                end # end of enumerable block
                valid_moves = valid_moves.compact # remove nil values from array(for board positions that were not valid)


                        Game::WIN_COMBINATIONS.each do |win_combination| #cycle though each winning combination, convert to board positions
                          win_index_1 = win_combination[0]
                          win_index_2 = win_combination[1]
                          win_index_3 = win_combination[2]

                          position_1 = (win_index_1 + 1).to_s  # convert to boad positions and cast as strings
                          position_2 = (win_index_2 + 1).to_s
                          position_3 = (win_index_3 + 1).to_s


                                # if valid_moves.include?("5")  #check valid_moves array for center position of board, if available, take it!
                                #   return 5
                                if valid_moves.include?(position_1) # if valid moves includes first position in winning combination, take it!
                                  return position_1
                                elsif valid_moves.include?(position_2) #  or, if valid moves includes second  position in winning combination, take it!
                                  return position_2
                                elsif valid_moves.include?(position_3) # lastly, if valid moves includes third  position in winning combination, take it!
                                  return position_3
                                end
                            end


              # old code  -- valid_moves = board.cells.find{|c|board.valid_move?(c)}
              #_________________________________________________________________________NEW CODE

          end # end of method

    end # end of Computer class

end # end of module
