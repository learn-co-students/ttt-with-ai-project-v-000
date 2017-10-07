class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

end

module Players
  class Human < Player
    def move(board)
      puts "Please enter a position 1-9"
      gets.strip
      
    end
  end

  class Computer < Player
    def move(board)
      if board.valid_move?("5")
          "5"
      elsif board.valid_move?("1") || board.valid_move?("3") || board.valid_move?("7") || board.valid_move?("9")    
        number = ["1","3","7","9"].sample until board.valid_move?(number)
        number
      elsif board.valid_move?("2") || board.valid_move?("4") || board.valid_move?("6") || board.valid_move?("8")
        number = ["2","4","6","8"].sample until board.valid_move?(number)
      end
    end
  end

end

