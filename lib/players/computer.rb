module Players
  class Computer < Player

    def move(board)
      puts "Please enter 1-9:"
      index = rand(1..9).to_s
      binding.pry
      puts "Computer player #{self.token} chooses position #{index}"
      index
    end
  end
end
