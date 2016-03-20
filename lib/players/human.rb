class Human < Player
  def move(board)
    puts "Where do you want to play, brah? Remember, type 1 to 9 only!"
    gets.strip
  end
end