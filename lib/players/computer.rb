module Players
  class Computer < Player


    def move(board)

      random_no = board.cells.sample
      new_random_no = random_no.index(random_no)

         if board.taken?(new_random_no)
           new_random_no
         else
          board.update(new_random_no, self)

        end
      end







  end
end
