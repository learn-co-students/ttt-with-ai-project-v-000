module Players
  class Human < Player
    def move #removed the board argument. 
      gets.strip
    end
  end
end
