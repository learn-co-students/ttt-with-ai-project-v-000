

module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move
      puts "Please select a cell (1 though 9)."
      rtn = gets.strip
      rtn
    end

  end
end
