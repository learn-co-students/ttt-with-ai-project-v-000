module Players
  class Computer < Player

    def move(board)
      computer_move = nil
        if !board.taken?(5)
          computer_move = 5
        elsif board.turn_count == 1
          computer_move = 1
        elsif board.turn_count == 2
          computer_move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}
        elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
          computer_move = 2
        else
          # computer_move = (1..9).detect { |n| board.valid_move?(n) }
          Game::WIN_COMBINATIONS.detect do |combo|
            if  combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
              computer_move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1)
            elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
              computer_move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            end
          end
        computer_move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if computer_move == nil
        end
      computer_move.to_s
    end
  end
end
