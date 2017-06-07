class Players
  class Computer < Player
    def move
      rand(9)
    end
  end
end
