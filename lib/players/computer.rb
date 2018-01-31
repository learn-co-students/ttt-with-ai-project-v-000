module Players
  class Computer < Player
    attr_accessor :game
    #Logic 1. always go to the third position left (+-3) on a column or row if the first two are filled
    #Logic 2: always go to 3rd position left in diagonal (+-2 or +-4) if the first two are filled
    #Logic 3: always go to the diagonal position of the previous move if it's available.
    #Logic 4: always go to the central position first if it's available.
    def move(a)
      if @game.turn_count == 0
        a = "5" #go to middle when board is empty
      elsif @game.turn_count == 1 #if second player, first move always go to diagonal cell
        if !@game.board.taken?("5")
          a = "5"
        else
          a = ["1","3","7","9"][rand(0..3)]
        end
      elsif @game.turn_count == 2 #second move if AI went first (go to diagonal corner cell)
        a = ["1","3","7","9"].detect{|a|!@game.board.taken?(a)} #occupy the corners whichever one was not occupied
      elsif @game.turn_count == 3 #second move beyond: first check if opponent has a winning move, if yes, block; if no, then go for a winning move
        index_array = [1..9].select {|a|@game.board.taken?(a.to_s) && @game.board.}
        difference = index_array[1] - index_array[0]
        if difference % 4 == 0 #if opponent's move is 2 positions diagonal to the left or right
          new_index = index_array.min - 4
          if @game.board.valid_move?(new_index.to_s)
            a = new_index.to_s
          end
          new_index = index_array.max + 4
          if @game.board.valid_move?(new_index.to_s)
            a = new_index.to_s
          end
          a = ["1","3","7","9"][rand(0..3)] #in the case that opponent is not occupying a corner (next step will be to win)
        elsif difference % 2 == 0
          new_index = index_array.min - 2
          if @game.board.valid_move?(new_index.to_s)
            a = new_index.to_s
          end

        end
      end
    end
  end
end
