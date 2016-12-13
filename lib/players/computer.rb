module Players
  class Computer < Player


    def move(board)

      random_no = board.cells.sample
      new_random_no = random_no.index(random_no)

         if board.taken?(new_random_no)
           board.update(new_random_no, self)
         else
          new_random_no

        end
      end







  end
end
