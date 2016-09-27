require 'pry'
module Players
    class Computer < Player

        attr_reader :opponent

        def move(board) #takes in Board Class instance
            self.token=="X" ? @opponent = "O" : @opponent = "X"
            array = board.cells #takes board elements from Class
            Game::WIN_COMBINATIONS.each do |combination|
                count = 0
                combination.each do |index|
                    array[index] == self.opponent ? count +=1  : nil
                    if count == 2
                        pos_move = combination.select{ |index| array[index] != self.opponent && array[index] != self.token}
                        if board.valid_move?(pos_move.first)
                            move = pos_move.first
                            return ((move)+1).to_s
                        end
                    end
                end
            end
            (array.index(" ")+1).to_s
            
        end
    end
end