module Players

  class Human < Player

    def move(choice)
      puts "Where would you like to move"
      choice = gets.chomp
      choice
    end


  end

end
