module Players
  class Human < Player

    def move(useless_argument=nil)
      gets.strip
    end
  end
end
