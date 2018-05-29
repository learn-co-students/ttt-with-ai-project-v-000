module Players
  class Human < Player

    def move(token)
      puts "Please make your selection."
      gets.strip

    end


  end
end
