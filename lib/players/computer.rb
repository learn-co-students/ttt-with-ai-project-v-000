module Players
  class Computer < Player

  AI_RESPONSES = ["It's my turn... human!","Do you really think you can defeat a computer?","My logical processors make this a fool's game ya know.","Now why'd you do that?", "Was that a kiss or a hug that you're entering?"]
    def move(board)
      sleep(1)
      if board.turn_count <= 2
        rand(1..9).to_s
      else
        rand(1..9).to_s
      end
    end

    #AI

    
  end
end
