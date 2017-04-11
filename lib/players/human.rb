require_relative "../player.rb"
module Players
  class Human < Player
    def move(input=nil)
      @input =  gets.strip
    end
  end

end
