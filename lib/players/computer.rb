module Players

  class Computer < Player

    def move(board)
      board.each do |cell|
          if cell == " " || cell == ""
            @cells["X"]
          end
      end #any iteration

    end

  end
end
