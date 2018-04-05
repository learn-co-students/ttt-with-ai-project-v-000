class Players

  class Human < Player

    attr_reader :token, :index

    def initialize(token)
      @token = token
    end

    def move(board)
<<<<<<< HEAD
      puts "Please enter your move.  Enter an open cell between 1 - 9."
      cell_num = gets.chomp
      cell_num
=======
      board.display
      puts "Where would you like to move?"
      gets.strip
>>>>>>> eac74a82fa019b6839fc80da2d9b430820b2e77d
    end

  end

end