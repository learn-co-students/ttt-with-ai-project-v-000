module Players
  class Human < Player
    #https://www.ruby-forum.com/topic/113558
    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end
  end
end
