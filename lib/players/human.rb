module Players
  class Human  < Player

  def move(board)
    i = "0"
    binding.pry
    until i.between?(1,9)
      puts "Please make a valid move:"
      i = gets.chomp
    end
    i
  end


    def are_we_human?
     "or are we dancers?"
    end
  end

end #class Human
