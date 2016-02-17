class Human < Player

  def move(board)
    puts "Please #{token}, enter a number from 1 - 9"
    gets.chomp
  end

end
