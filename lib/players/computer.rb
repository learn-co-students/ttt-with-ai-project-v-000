module Players
    class Computer < Player
        def thinking
            sleep(0.5)
            puts "..."
            sleep(0.5)
            puts "Computer Thinking..."
            sleep(0.5)
            puts "..."
            puts ""
            sleep(1)
        end
        
        def move(board)
            move = nil 
            if board.valid_move?(5)
                move = "5"

            #opponent has gone first (turn_count == 0) and taken middle (5)
            #then, take (1)
            elsif board.turn_count == 1
                move = "1"

            #you went first, took (5). Then opponent went.
            #now take an available corner square    
            elsif board.turn_count == 2
                move = [1,3,7,9].detect{|space| !board.taken?(space)}.to_s

            #opponent went first. you went second(took middle or (1)). opponent went third. now your turn.
            #say you took middle on second turn.
            #that means opponent may have diagonal ends occupied (either 1 and 9 or 3 and 7)
            #move to position 2 and then opponent will have to move to 8 to block you from winning
            elsif board.turn_count == 3 && ((board.position(1) == board.position(9) && board.taken?(1))|| (board.position(3) == board.position(7) && board.taken?(3))) 
                move = "2"
            
            #Any other scenario will involve going through WIN COMBINATIONS arrary
            #The idea is to look at each group of the three winning indices 
            #and check:
            #   do two of the three have the same token (i.e., "X" or "O") and
            #   is the third on blank (i.e., " ")    
            else
                Game::WIN_COMBINATIONS.detect { |combo|

                    #These values explained below.
                    value1 = combo.select{ |index| board.position(index + 1) == token}.size == 2
                    value2 = combo.select{ |index| board.position(index + 1) == " "}.size == 1
                    value3 = combo.select{ |index| board.position(index+1) != self.token && board.position(index+1) != " "}.size == 2

                    #Go for the win first: look for two of the three space being your token. This is value1. (check that third is blank. This is value2)
                    # move the that blank
                    if value1 && value2
                         move = combo.select{|index| board.position(index+1) == " "}.first.to_i.+(1).to_s

                    #Can't win? Go on defense: look for two of the three being your opponents token. This is value3. (check that third is blank. This is value2)
                    # move to that blank   
                    elsif value3 && value2
                         move = combo.select{|index| board.position(index+1) == " "}.first.to_i.+(1).to_s
                    end
                }
            
                # if move is STILL == nil (it was set to nil right at the beginning of the method), that means
                # none of the winning combos have 2 filled with same token and one blank.
                # The strategy now is to occupy the first open corner, and if all corners are taken, then look at sides.
                move = [1,3,7,9,2,4,6,8].detect{|index| board.position(index) == " "}.to_s if move == nil
            end
            thinking
        move
        end
    end
 end
