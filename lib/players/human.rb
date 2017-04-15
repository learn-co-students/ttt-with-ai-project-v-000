module Players
  class Human < Player
    #https://www.ruby-forum.com/topic/113558
    def move(board)
    gets.strip
    end
  end
end
