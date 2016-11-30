module Players
  class Human < Player

    def move(cells)
      print "Enter your move [1-9]:"
      gets.strip
    end

  end
end
