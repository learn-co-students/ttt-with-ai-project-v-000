require_relative "../board.rb"
require 'pry'

module Players
    class Computer < Player

        WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], 
                        [0,3,6], [1,4,7], [2,5,8], 
                        [0,4,8], [2,4,6]]

        def move(board)
            puts "The computer has made a move: "
            #Strategy in first two turns of game
            if board.turn_count < 2
                if board.valid_move?("5")
                    "5"
                else
                    "1"
                end
            #Strategy for the rest of the game
            else
                open_combos = {}
                #Identify open combos and count occupied spaces in each
                WIN_COMBINATIONS.each do |combo|
                    if (board.cells[combo[0]] == " " || 
                        board.cells[combo[0]] == self.token) &&
                        (board.cells[combo[1]] == " " || 
                        board.cells[combo[1]] == self.token) &&
                        (board.cells[combo[2]] == " " || 
                        board.cells[combo[2]] == self.token)

                        #Count occupied spaces in open combo
                        occupied = 0
                        if board.cells[combo[0]] == self.token
                            occupied += 1
                        end
                        if board.cells[combo[1]] == self.token
                            occupied += 1
                        end
                        if board.cells[combo[2]] == self.token
                            occupied += 1
                        end

                        #Add to open_combos
                        open_combos[combo] = occupied
                        open_combos = open_combos.sort_by { |combo, occupied| occupied }.reverse.to_h
                    end
                end #end filling open combos
                
                #PRIORITY 5: any open positions 
                #binding.pry
                if open_combos == {}
                    board.cells.each_with_index do |cell, index|
                        if cell == " "
                            return index + 1
                        end
                    end 
                end #end priority 5: last open cells

                #PRIORITY 1: If an open combo is 2/3 full, fill it
                if open_combos.first[1] == 2
                    open_combos.first[0].each do |position|
                        if board.cells[position] == " "
                            return position + 1
                        end
                    end
                end 

                #PRIORITY 2: If opponent open combo is 2/3 full, block it
                opponent_open_combos = {}
                WIN_COMBINATIONS.each do |combo|
                    if (board.cells[combo[0]] == " " || 
                        board.cells[combo[0]] != self.token) &&
                        (board.cells[combo[1]] == " " || 
                        board.cells[combo[1]] != self.token) &&
                        (board.cells[combo[2]] == " " || 
                        board.cells[combo[2]] != self.token)

                        #Count occupied spaces in open combo
                        occupied = 0
                        if board.cells[combo[0]] != self.token &&
                            board.cells[combo[0]] != " "
                            occupied += 1
                        end
                        if board.cells[combo[1]] != self.token &&
                            board.cells[combo[1]] != " "
                            occupied += 1
                        end
                        if board.cells[combo[2]] != self.token &&
                            board.cells[combo[2]] != " "
                            occupied += 1
                        end

                        #Add to open_combos
                        opponent_open_combos[combo] = occupied
                        opponent_open_combos = opponent_open_combos.sort_by { |combo, occupied| occupied }.reverse.to_h
                    end
                end #end filling opponent open combos
        
                if opponent_open_combos.first[1] == 2
                    opponent_open_combos.first[0].each do |position|
                        if board.cells[position] == " "
                            return position + 1
                        end
                    end
                end #end priority 2

                #PRIORITY 3: Fill corners
                if open_combos.first[1] == 1
                    open_combos.to_a.each do |combo|
                        combo[0].each do |position|
                            if position == 0 && board.cells[position] == " "
                                return position + 1
                            elsif position == 2 && board.cells[position] == " "
                                return position + 1
                            elsif position == 6 && board.cells[position] == " "
                                return position + 1
                            elsif position == 8 && board.cells[position] == " "
                                return position + 1
                            end
                        end
                    end
                end #end priority 3: fill corners

                #PRIORITY 4: If open combo is 1/3 full, fill it
                if open_combos.first[1] == 1
                    open_combos.to_a.each do |combo|
                        combo[0].each do |position|
                            if board.cells[position] == " "
                                return position + 1
                            end
                        end
                    end
                end #end priority 4: fill 1/3 open combos
            end #end else: turn_count > 2
        end #end .move
    end 
end 