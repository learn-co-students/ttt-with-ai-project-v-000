module Players
  class Computer < Player
    #Logic 1. always go to the third position left (+-3) on a column or row if the first two are filled
    #Logic 2: always go to 3rd position left in diagonal (+-2 or +-4) if the first two are filled
    #Logic 3: always go to the diagonal position of the previous move if it's available.
    #Logic 4: always go to the central position first if it's available.
    def move(a)
      board_index_array = @board.cells.collect {|a|a.index}
    end
  end
end
