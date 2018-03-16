

class Players

    class Computer < Player

        def move(board)
            puts "AI is thinking....."
            sleep 3
            rand(1..9).to_s
        end
        ##find_quickest_win checks win combinataions and current board to find the first match with the most taken spaces

        # def find_quickest_win
        #
        # end


    end
end
