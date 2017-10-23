module Players
  class Human < Player
    attr_accessor :input
    def initialize(token)
      super
    end

    def move(input)
      self.input  = gets.strip
    end
  end

end
