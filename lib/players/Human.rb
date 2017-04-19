class Players
  class Human < Player
     def move(num)
       @num = gets.chomp
     end
  end
  class Computer < Player
     def move(board)
        "1"
     end
  end

end
