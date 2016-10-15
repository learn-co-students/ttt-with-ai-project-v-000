module Players
  class Computer < Player

    CORNERS = ["1", "3", "7", "9"]
    SIDES = ["2", "4", "6", "8"]

    def move(board)
      @move = nil
      Game::WIN_COMBINATIONS.each do |win_combo|
        if board.cells[win_combo[0]] != " " && board.cells[win_combo[1]] != " " && board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.valid_move?(win_combo[2] + 1)
          @move = (win_combo[2] + 1).to_s
        elsif board.cells[win_combo[1]] != " " && board.cells[win_combo[2]] != " " && board.cells[win_combo[1]] == board.cells[win_combo[2]] && board.valid_move?(win_combo[0] + 1)
          @move = (win_combo[0] + 1).to_s
        elsif board.cells[win_combo[0]] != " " && board.cells[win_combo[2]] != " " && board.cells[win_combo[0]] == board.cells[win_combo[2]] && board.valid_move?(win_combo[1] + 1)
          @move = (win_combo[1] + 1).to_s
        end
      end

      if @move.nil?
        if board.valid_move?(5)
          @move = 5
        elsif CORNERS.any?{|corner| board.valid_move?(corner)}
          @move = CORNERS.find{|corner| board.valid_move?(corner)}
        else
          @move = SIDES.find{|side| board.valid_move?(side)}
        end
      end
      @move
    end

  end #close class
end #close module
