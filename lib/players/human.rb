module Players
  class Human < Player

    attr_accessor :move

    def move(input)
      self.move = gets
    end

  end
end
