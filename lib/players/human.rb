module Players
  class Human < Player #inherits from Player

    attr_reader :input, :token

    def initialize(token)
      @token = token
    end

    def move(board) #asks the user for input and returns it
      puts "#{token}: Please select an open position from 1 to 9:"
      gets.strip
    end

  end
end
