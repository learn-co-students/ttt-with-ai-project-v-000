module Players
  class Computer < Player
    attr_accessor :type

    def type
      @type = "Computer"
    end

    def move(board)
      puts "Please enter 1-9:"
      index = rand(1..9).to_s
      # binding.pry
      puts "Computer player #{self.token} chooses position #{index}"
      index
    end
  end
end
