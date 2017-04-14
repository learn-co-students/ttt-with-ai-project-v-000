module Players

  class Computer < Player

    def move(board=[])
      computer_move = rand(1..9).to_s
      puts "Computer's Move"
      sleep(1)
      computer_move
    end
  end

end
