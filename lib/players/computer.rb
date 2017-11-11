class Players
  class Computer < Player

    def move(array)
      puts "I'll make a move"
      rand(1..9)
    end

  end
end
