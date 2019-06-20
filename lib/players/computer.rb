module Players
  class Computer < Player


    def move(user_input)
      user_input = rand(1..9)
      choice = user_input.to_i - 1
      if choice.between?(1, 9)
        choice.to_s
      end


    end

  end
end
