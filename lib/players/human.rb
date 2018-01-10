module Players
  class Human < Player
# call Human class as Players::Human
    def move(cells)
      puts "Please enter your next move."
      input = gets
      #working but could change input name
    end
  end
end
