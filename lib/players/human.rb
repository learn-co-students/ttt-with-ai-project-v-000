module Players
  class Human < Player
    def move(cells)
        puts "Please enter 1-9:"
        input = gets
        input
    end
  end
end


