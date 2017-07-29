module Players
  class Computer < Player

    def move(board)
      if !board.taken?("5")
        "5"
      elsif !take_corner(board).empty?
        take_corner(board).sample # randomly selects a element in an array
    elsif opponent_token(board).count == 2

    end
  end

    def find_win_combos(board)
      Game::WIN_COMBINATIONS.collect { |combo| combo.collect {|cell| cell = board.cells[cell]} }
    end

    def take_corner(board)
      corners = ["1","3","7","9"]
      corners.select { |move| !board.taken?(move)}
    end

    def opponent_token(board)
      case @token
      when "X"
        "O"
      when "O"
        "X"
      end
    end

    #
    # def block_game(board)
    #
    # end
    #
    # def win_game(board)
    #   if @toke
    # end
    #

end
end
