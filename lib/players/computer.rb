module Players

  class Computer < Player

    attr_accessor :board

    def move
      rand(1..9).to_s
    end

  end

end
