module Players

  class Computer < Player

    def move(board)
      pick = rand(1...10).to_s
      if !board.taken?(pick)
        pick
      else
        move
      end
    end



  end #Human class
end #Players mod
