class Human < Player

   def move(*board)
    puts "Where would you like to move?(1-9)" # <= added
    input = gets.chomp
  end

end