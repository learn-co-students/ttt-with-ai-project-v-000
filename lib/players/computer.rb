module Players
  class Computer < Player
    attr_accessor
    # def initialize
    #
    # end

    def move(board)
      puts "Computer is making it's move..."
      sleep(1)
      rand(1..9).to_s
    end

  end

end
