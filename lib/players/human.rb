class Human < Player

  def move(board=nil)
    puts "Please select a position between 1-9: "
    position = gets.chomp
  end

end