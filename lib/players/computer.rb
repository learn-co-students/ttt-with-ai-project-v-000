module Players
  class Computer < Player

    # Players::Computer

    def move(board)


      puts "Let's Play Tic Tac Toe!"
      display

      play
      puts "Please enter a number from 1-9"
      if !board.taken?(3)
        move = "3"
    end
  end

  end
end
