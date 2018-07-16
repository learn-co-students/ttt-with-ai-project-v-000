module Players
  class Computer < Player

    def move(user_input)
      user_input = rand(1..9)
      binding.pry
    end

  end
end
