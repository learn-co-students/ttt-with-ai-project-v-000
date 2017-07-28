module Players
  class Human < Player

    def move(user_input)
      puts "Please pick a spot 1-9"
      user_input = gets.strip
    end

end
end
