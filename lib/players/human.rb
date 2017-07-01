module Players
  class Human < Player
    def move(input)
      puts "Please enter 1-9:"
        input = gets.strip
    end
  end
end


# def move(board, index, character)
#   board[index] = character
#   turn_count(board)
#   display_board(board)
# end
