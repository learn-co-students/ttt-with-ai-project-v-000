module Players
  class Human < Player
    # your code here

    def move(board)

      puts "#{self.token}: Which cell number?"
      cellnum = gets.strip

    end

  end
end
