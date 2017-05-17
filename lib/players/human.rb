module Players
  class Human < Player

    def move(board)
      puts "Move? "
      gets.strip
    end
  end

end
