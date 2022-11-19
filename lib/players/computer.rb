module Players
  class Computer < Player



    def move(board)
      sleep(1)
      if !board.taken?(5)
        move = "5"
      elsif board.taken?(5) && !board.corners_taken?
        move = [1,3,7,9].detect {|num| !board.taken?(num)}.to_s
      else
        if !board.full?
          avail = []
          board.cells.each_with_index do |cell,index|
            if cell == " "
               avail << index + 1
            end
          end
          move = avail.sample
        end
      end
    end
  end
end
