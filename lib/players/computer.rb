module Players
  class Computer < Player


    def move(board)
      random_no = board.cells.sample
        new_random_no = random_no.index(random_no)
          random = (new_random_no + 1)
          if board.taken?(random)
            new_random_no
          else
            board.update(random, self)
          end
      end







  end
end
