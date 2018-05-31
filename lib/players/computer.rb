require 'pry'

module Players

  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = "2"
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      else
        Game::WIN_COMBINATIONS.detect do |cmb|
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          else
            computer_win(board)
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
    end

    def computer_win(board)
      empty_win_combo = Game::WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == self.token && board.cells[combo[2]] == " " || board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] == self.token && board.cells[combo[0]] == " " || board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] == self.token && board.cells[combo[1]] == " "
      end
      if empty_win_combo == nil
        block_player(board)
      elsif empty_win_combo[0] == " "
        move = empty_win_combo[0] + 1
      elsif empty_win_combo[1] == " "
        move = empty_win_combo[1] + 1
      else empty_win_combo[2] == " "
        move = empty_win_combo[2] + 1
      end
      move.to_s
    end

    def block_player(board)
      empty_block_combo = Game::WIN_COMBINATIONS.find do |combo|
         board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] != self.token && board.cells[combo[2]] == " " || board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] != self.token && board.cells[combo[0]] == " " || board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != self.token && board.cells[combo[1]] == " "
      end
      if empty_block_combo[0] == " "
        binding.pry
        move = empty_block_combo[0] + 1
      elsif empty_block_combo[1] == " "
        move = empty_block_combo[1] + 1
      else empty_block_combo[2] == " "
        move = empty_block_combo[2] + 1
      end
      move.to_s
    end

  end
end
