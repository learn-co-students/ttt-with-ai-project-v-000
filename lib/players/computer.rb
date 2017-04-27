module Players
  class Computer < Player
    def move(board)
      if valid_move?()
        #user_input = gets
        "#{user_input}"
      end
    end
    def position(user_input)
      integer = user_input.to_i- 1#converst user input string to array index
      #binding.pry
      return "#{@cells[integer]}"#looks up the value of the cells at the correct index from the array's perspective
    end
    def valid_move?(input)
      input.to_i.between?(1,9) && !taken?(input)
    end
    def taken?(user_input)
       position(user_input) == "X" || position(user_input) == "O"
    end
    #https://www.ruby-forum.com/topic/113558
  end
end
#https://codereview.stackexchange.com/questions/108961/tictactoe-game-with-functional-ai-in-ruby-follow-up
