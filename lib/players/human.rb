module Players
  class Human < Player

    def move(board)
      print "#{self.token}, Please enter 1-9: "
      gets.strip
    end
  end
end
