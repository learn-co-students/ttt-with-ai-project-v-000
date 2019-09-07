module Players

  class Computer < Player
    def move(board)
       num = rand(1..9)
       return "#{num}"
    end
  end

end