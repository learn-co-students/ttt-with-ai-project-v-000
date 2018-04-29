module Players
  class  Human < Player

    def move(board)
      puts "Please choose a number 1 -9"
      gets.strip
    end
  end

end
