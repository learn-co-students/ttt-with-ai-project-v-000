module Players
  class Human < Player
    def initialize(token)
      super
    end

    def move(input)
      input = gets.strip
    end
  end

end
