module Players
  class Computer < Player
    def move(*)
      index = rand(1..9).to_s
      index
    end
  end
end
