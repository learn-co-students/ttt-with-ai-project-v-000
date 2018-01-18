class Human < Player

  def move(board) #takes in the board argument >> don't understant why we need this argument
    puts "Where to move (1-9)?"
    gets.strip
  end

end
