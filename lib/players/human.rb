module Players
  class Human < Player

    def move(move)
      gets "#{self.token}, where would you like to move (1-9)?"
    end

  end
end
