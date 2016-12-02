module Players
  class Computer < Player
    def move(num)
      rand(9).to_s
    end
  end
end
