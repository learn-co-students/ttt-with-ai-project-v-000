class Players

  class Computer < Player

    def move(board)
      free_moves=[]
      #Iterate through board and see which positions are free
      (1..9).each do |pos|
        free_moves << pos unless board.taken?(pos)
      end
      #Generate a random array position
      random = rand(0..free_moves.length-1)
      #Return a random position from array of free moves
      free_moves[random].to_s



    end #move

  end #class Computer

end #class Players
