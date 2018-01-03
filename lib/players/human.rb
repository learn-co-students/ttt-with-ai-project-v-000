module Players
  class Human < Player


    def move(board)
      puts "#{board.current_player},input between 1-9?"
      input=gets.strip
    end


  end
end
