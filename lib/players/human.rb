module Players
  class Human < Player
    attr_accessor :last_move

    def move(input)
      puts input
      puts "Please enter 1-9:"
      gets.strip

    end

  end

end
