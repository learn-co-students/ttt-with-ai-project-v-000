module Players
  class Human < Player
    def move(board)
      puts  "Please enter a move 1-9"
      user_input = gets.strip
      "#{user_input}"
    end
    #https://www.ruby-forum.com/topic/113558
  end
end
