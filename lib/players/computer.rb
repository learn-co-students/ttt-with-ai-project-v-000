module Players
    class Computer<Player

        def move(board)
            #board is the board object
            @board = board
            @combos = [ [0,1,2],
                [3,4,5],
                [6,7,8],
                [0,3,6],
                [1,4,7],
                [2,5,8],
                [0,4,8],
                [6,4,2]]
            #Establish opponent token
            if self.token == "X"
                opponent = "O"
            else
                opponent = "X"
            end

            def winning?(token)
                #checks if a player's token is about to win
                @combos.detect do |combo|
                    counter = 0 #total in line
                    anti=0 #space occupied by other token
                    combo.each  do |index|
                        if @board.cells[index]==token
                            counter += 1
                        elsif @board.cells[index]!=" "
                            anti += 1
                        end
                    end
                    counter-anti == 2
                end
            end

            #Check if you're about to win and make right move
            #Check if opponent is about to win and block first chance
            if !winning?(self.token).nil?
                return (winning?(self.token).detect{|index| @board.valid_move?(index+1)}+1).to_s
            elsif !winning?(opponent).nil?
                return (winning?(opponent).detect{|index| @board.valid_move?(index+1)}+1).to_s
            elsif !@board.taken?(0) || !@board.taken?(2) || !@board.taken?(8) || !@board.taken?(6)
                #Try to set up easy win with corners
                temp=[0,2,8,6].select {|index| @board.valid_move?(index+1)}
                return (temp.sample+1).to_s
            else
                #if no corner available, try a random spot
                index = 4 #center by default
                until @board.valid_move?(index+1) do
                    index = (0..8).to_a.sample
                end
                return (index+1).to_s
            end



            #returns an intelligent valid board position as a string
        end
    end
end
