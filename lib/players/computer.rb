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
        index = [1..9].detect {|a|@game.board.taken?(a.to_s) == true}
        if index < 6
          a = index + 4
        else
          a = index - 4
        end
      elsif @game.turn_count == 2 #second move if AI went first (go to diagonal corner cell)
        a = ["1","3","7","9"][rand(0..3)]
      elsif @game.turn_count == 3 #second move if AI went second (block)
        index_array = [1..9].collect {|a|@game.board.taken?(a.to_s) == true}
        difference = index_array[1] - index_array[0]
        if difference % 4 == 0 #if opponent's move is 2 positions diagonal
          if @game.board.valid_move?(index_array.min.to_s)
          end
        end
      end
    end
  end
end
