module Players
  class Human < Player

    def move(board = Board.new)
      puts "Please input a number between 1-9:"
      input = gets.strip
    end
  end

  class Computer < Player
    def move(board = Board.new)
      if board.position(5) == " "
        input = 5
      elsif board.position(3) == " "
        input = 3
      else
      input = 1
      end
      loop do
        if board.valid_move?(input)
          break
        else
          input+=1
        end
      end
      "#{input}"
    end

  end


end
