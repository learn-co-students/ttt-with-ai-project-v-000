module Players
  class Human < Player
    def move(board)
      user_input = gets
      "#{user_input}"
    end
    #https://www.ruby-forum.com/topic/113558
  end
end
