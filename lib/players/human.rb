module Players
  class Human < Player

    def initialize(token)
      super
    end

    def move(board)  
      puts "Please enter 1-9:"
      input = gets.strip
    end
  end 
end