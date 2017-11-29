module Players
  class Computer < Player
    def move(board)

<<<<<<< HEAD
       move = rand(1..9)
=======
       move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect{|i| !board.taken?(i)}.to_s
>>>>>>> abcef95ecdcb4d704a4873ec2770e65e27e70215



      # if !board.taken?(5)
      #   move = "5"
      #
      # elsif board.turn_count <= 4
      #   move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      #
      # else
      #
      #    Game::WIN_COMBINATIONS.detect do |combo|
      #        if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
      #          move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
      #        else
      #          move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect{|i| !board.taken?(i)}.to_s
      #
      #        end
      #        move
      #    end
      #
      # end
    end
  end
end
