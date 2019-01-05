module Players
  class Human < Player
  
  def move(board)
    board.display
    puts "Where would you like to play? Enter 1-9."
    input = nil
    until board.valid_move?(input)
      puts "invalid"
      input = gets.strip
    end
    input
    #binding.pry
  end
  
  end
end
  