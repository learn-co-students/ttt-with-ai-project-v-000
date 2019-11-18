module Players
  class Computer < Player
    def move(board)
       board.cells.each do |space|
        # computer_move1 = board.cells.index(space) + 5
        #   if board.valid_move?(computer_move1)
        #     return computer_move1.to_s
          computer_move2 = board.cells.index(space) + 1 || board.cells.index(space) + 2 ||
          board.cells.index(space) + 3 || board.cells.index(space) + 4 || board.cells.index(space) + 5 ||
          board.cells.index(space) + 6 || board.cells.index(space) + 7 || board.cells.index(space) + 8 ||
          board.cells.index(space) + 9

            rand(computer_move2)
            # binding.pry
            # computer_move2
            if board.valid_move?(computer_move2)
              return computer_move2.to_s
            end
          # elsif computer_move3 = board.cells.index(space) + 2 || board.cells.index(space) + 4 ||
          # board.cells.index(space) + 6 || board.cells.index(space) + 8
          #   rand(computer_move3)
          #   if board.valid_move?(computer_move3)
          #     return computer_move3.to_s
          #   end
          # end
      end
    end
  end
end

# trace = TracePoint.new(:return) { |tp| puts "Return value for #{tp.method_id} is #{tp.return_value}." }
# trace.enable
# move(board)
# trace.disable
