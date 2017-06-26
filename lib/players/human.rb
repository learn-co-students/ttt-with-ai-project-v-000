module Players
  class Human < Player

    def move(cells)
      puts "Your move hot shot"
      pos = gets.strip
    end
  end
end
