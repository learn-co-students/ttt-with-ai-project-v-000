# module Players
#   class Computer < Player
#     def move(board)
#       valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#       board.cells.each do |space|
#         if board.valid_move?(valid_moves[space.to_i - 1])
#           valid_moves[4]
#         elsif board.valid_move?(valid_moves[space.to_i - 1])
#           valid_moves[0] || valid_moves[2] ||
#           valid_moves[6] || valid_moves[8]
#         elsif board.valid_move?(valid_moves[space.to_i - 1])
#           valid_moves[1] || valid_moves[3] ||
#           valid_moves[5] || valid_moves[7]
#         end
#         # binding.pry
#       end
#     end
#   end
# end

module Players
  class Computer < Player
    def move(board)
      # valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      board.cells.each do |space|
        if board.valid_move?(space.to_i + 1)
          space.to_i + 1
        #
        # # elsif board.valid_move?(valid_moves[space.to_i - 1])
        # #   valid_moves[0] || valid_moves[2] ||
        # #   valid_moves[6] || valid_moves[8]
        # # elsif board.valid_move?(valid_moves[space.to_i - 1])
        # #   valid_moves[1] || valid_moves[3] ||
        # #   valid_moves[5] || valid_moves[7]
        # end
        binding.pry
      end
    end
  end
end

# describe '#move' do
#     it 'returns a valid position for the computer to move' do
#       computer = Players::Computer.new("X")
#       board = Board.new
#
#       valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#
#       computer_move = computer.move(board)
#
#       expect(valid_moves).to include(computer_move)
#     end
#   end

#   to me this said "computer_move (the return value of our move method) should be
#   one of those elements inside valid_moves"
#
#   well i don't think you need your own valid_moves array
#
# we can just derive the string for the move our computer wants to make from the index + 1 of the board space

# a = [ "a", "b", "c" ]
# a.each_index {|x| print x, " -- " }
# produces:
#
# 0 -- 1 -- 2 --
# a.find_index(obj)
# a.insert(index, obj)
