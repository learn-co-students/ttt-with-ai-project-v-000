module Players
  class Computer < Player

    def move(board)

      if !board.taken?(5) 
          move = "5"
      else
        Random.rand(1..9).to_s
      end
    end #move end



  end #class end

end #module end
