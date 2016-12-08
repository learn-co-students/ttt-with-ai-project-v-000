module Players
  class Human < Player


#attr_reader :token

# def initialize(token)
  # @token = token
# end

    def move(board)
      puts "Choose a number between 1-9 fam:"
      input = gets.chomp
       input
    end

  end
end
