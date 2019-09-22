module Players
  class Computer < Player
    def move(board)
      ##choose the first open spot
      #i = board.cells.index(" ")+1
      #i.to_s

      #choose a random open spot
      openSpots = []
      board.cells.each_with_index do |c, i|
        if c == " "
          openSpots << i
        end
      end
      openSpot = openSpots.sample+1
      openSpot.to_s
    end
  end
end
