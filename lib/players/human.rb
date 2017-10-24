module Players
  class Human < Player
    def move(board)
      puts "Numbered spaces are open..."
      puts "Please enter a position: "
      print ">"
      gets.chomp
    end
  end
end
