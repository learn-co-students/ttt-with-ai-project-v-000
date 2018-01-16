module Players
  class Computer < Player

    def move(board)
      puts "Please enter 1-9:"
      input = rand(1..9).to_s
      puts "Computer chooses position #{input}"
      input
    end

  end
end
