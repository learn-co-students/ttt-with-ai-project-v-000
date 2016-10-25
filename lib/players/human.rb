module Players
  class Human < Player

    def move(board)
      puts "Dear user what 'tis your input?'"
      input = gets.strip
      input
    end

  end
end
