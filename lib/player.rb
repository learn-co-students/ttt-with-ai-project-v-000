class Player
attr_reader :token

  def initialize(token)
    @token = token
  end


end

module Players
  class Human < Player

    def move(board)
      puts "Please enter an integer between 1-9 to make a move"
      input = gets.chomp
    end



  end

end
