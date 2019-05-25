module Players

  class Computer < Player

    def move(board)
      # binding.pry
      # response = gets.chomp
      # binding.pry
      computer_move = rand(1..9).to_s
      # binding.pry
    end


  end

end
