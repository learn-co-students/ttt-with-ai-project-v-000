module Players
  class Human < Player

    def move(_board)
      puts
      print "Please enter 1-9: "
      gets.strip
    end

  end # class Hoooman
end # module Players
