module Players
  class Computer < Player
      WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6],
    ]

    def move(board)
      #sleep(0.15)
      move = nil

     if board.turn_count == 0
       move = "5"
     elsif !board.taken?(5)
       move = "5"
     elsif board.taken?(5) && board.turn_count == 1
       move = "1"
     elsif board.turn_count == 2
       move = "#{[1, 3, 7, 9].detect{|i| !board.taken?(i)}}"
     elsif board.turn_count == 3 && ((board.position(1) == board.position(9)) || (board.position(3) == board.position(7))) && !board.taken?("2")
       move = "2"
     else
       WIN_COMBINATIONS.detect do |winning|
         if move != nil
           break
         elsif (board.position("#{winning[0] + 1}") == board.position("#{winning[1] + 1}")) && board.taken?("#{winning[0] + 1}") && !board.taken?("#{winning[2] + 1}")
           move = "#{winning[2] + 1}"
        elsif (board.position(winning[0] + 1) == board.position(winning[2] + 1)) && board.taken?("#{winning[0] + 1}") && !board.taken?("#{winning[1] + 1}")
          move = "#{winning[1] + 1}"
        elsif (board.position(winning[1] + 1) == board.position(winning[2] + 1)) && board.taken?("#{winning[1] + 1}") && !board.taken?("#{winning[0] + 1}")
             move = "#{winning[0] + 1}"
         end
    end
          move = [1, 3, 7, 9, 5, 2, 4, 6, 8].select{|i| !board.taken?(i)}.first.to_s if move == nil
      end
      move
    end
  end
end
