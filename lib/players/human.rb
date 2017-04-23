module Players
  class Human < Player
    def move(board)
      puts  "Please enter a move 1-9"#system prompts for user input, and waits for user input
      user_input = gets.strip#assigns inputs to variable, & /n is stripped
      ##{user_input}"#what does this line do?
      user_input#returns user_input to be received by?
    end
    #https://www.ruby-forum.com/topic/113558
  end
end
