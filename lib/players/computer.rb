module Players
  class Computer < Player
    attr_accessor :type

    def type
      @type = "Computer"
    end

    def move(board)
      index = nil
      puts "Please enter 1-9:"
      if [0,1].include?(board.turn_count)
        if board.valid_move?(5)
          index = 5
        else
          index = [1,3,7,9].sample
        end
      else
        index = rand(1..9).to_s
      end
      # binding.pry
      puts "Computer player #{self.token} chooses position #{index}"
      index
    end
  end
end
