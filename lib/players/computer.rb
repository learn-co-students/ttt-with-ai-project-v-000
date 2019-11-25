module Players
  class Computer < Player
    def move(board)

      # board.cells.each_index do |space|
      #   if board.valid_move?(space)
      #     return space.to_s
      #   end
      # #  this works

      # board.cells.each do |space|
      #   computer_move = board.cells.index(space) + 1
      #   if board.valid_move?(computer_move)
      #     return computer_move.to_s
      #   end
      ## this passes

      # board.cells.find do |space|
      #   computer_move1 = board.cells.index(space) + 1
      #     if board.valid_move?(computer_move1)
      #       return computer_move1.to_s
      #     end
          ## this passes

      # def position(input)
      #     cells[input.to_i - 1]
      #     # binding.pry
      # end
      ## position method - think have to use this method

        #  computer_move1 = board.position(space)
        #  computer_move1 = board.cells[space.to_i - 1]
          # binding.pry
          # if board.position(computer_move1)
            # return computer_move1.to_s
          # end

        #  myArray = ["stuff", "widget", "ruby", "goodies", "java", "emerald", "etc" ]
        #  item = myArray[rand(myArray.length)]

      board.cells.each do |space|
        # if computer_move1 = rand(board.cells.index(space))
        if computer_move1 = board.cells.index(space) + 5
          if board.valid_move?(computer_move1)
            return computer_move1.to_s
          end
        elsif computer_move2 = (board.cells.index(space) + 1, board.cells.index(space) + 3,
          board.cells.index(space) + 7, board.cells.index(space) + 9)
          rand(computer_move2)
          binding.pry

      #     # computer_move2 = computer_move2[rand(computer_move2.length)]
      # # elsif computer_move2 = board.cells[rand(board.cells.length)]
          if board.valid_move?(computer_move2)
            return computer_move2.to_s
          end
        end

        # computer_move2.select do |mov|
        #   if mov == "5"
        # # rand(computer_move2)
        #   # if board.valid_move?(computer_move2)
        #     if board.valid_move?(mov)
        #     return mov.to_s
        #   end

        # binding.pry
          # computer_move2 << board.cells.index(space) + 1 || board.cells.index(space) + 2 ||
          # board.cells.index(space) + 3 || board.cells.index(space) + 4 || board.cells.index(space) + 5 ||
          # board.cells.index(space) + 6 || board.cells.index(space) + 7 || board.cells.index(space) + 8 ||
          # board.cells.index(space) + 9
          #
          #   rand(computer_move2)
            # binding.pry
            # computer_move2
            # if board.valid_move?(computer_move2)
            #   return computer_move2.to_s
            # end
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
