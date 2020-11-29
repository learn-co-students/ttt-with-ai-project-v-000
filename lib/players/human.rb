module Players
class Human < Player
  #inherits from Player

  def move(board)
    #asks the user for input and returns it.
    puts "Please enter 1-9:"
    gets.chomp
  end
end
end
