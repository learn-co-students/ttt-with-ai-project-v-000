module Players
  class Human < Player

    attr_reader :token, :index

    def initialize(token)
      @token = token
    end

    def move(board)
      puts "Please enter your move.  Enter an open cell between 1 - 9."
      cell_num = gets.chomp
      cell_num
    end

  end

end
