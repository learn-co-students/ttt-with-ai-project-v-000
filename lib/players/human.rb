module Players
  class Human < Player

    def move(board_array)
      input = gets.chomp.to_i
      if board_array[input - 1] == " "
        input
      end
      input.to_s
    end

  end
end
