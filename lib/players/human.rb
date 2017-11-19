module Players
  class Human < Player
    def move(item)
      puts "Please enter your move:"
      item = gets
    end
  end
end
