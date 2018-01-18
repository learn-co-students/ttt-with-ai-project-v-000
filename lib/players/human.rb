module Players
  class Human < Player

    def move(board)
      print "#{self.token}, please enter 1-9: "
      gets.strip
    end
  end
end
