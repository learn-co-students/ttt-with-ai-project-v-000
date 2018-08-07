module Players
  class Human < Player

    def move(token)
      game = Board.new(token)#.user_input
      input = gets.strip
    end


  end
end
