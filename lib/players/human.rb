module Players
  class Human < Player
    def move(v)
      puts "Please enter move: (1-9)"
      input = gets
    end
  end
end
