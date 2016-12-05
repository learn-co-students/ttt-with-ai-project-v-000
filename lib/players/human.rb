module Players


  class Human < Player



    def move(board)
      input = gets.chomp
      puts "Where would you like to go? Please enter number 1-9"
      input
    end



  end



end
