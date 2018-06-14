require "pry"
module Players
  class Computer < Player

    def move(input)
      (rand(9) + 1).to_s
    end
  end
end 
