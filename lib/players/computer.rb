

# require 'pry'
# module Players
# class Computer < Player



#     def opponent_token
#   #if the opponent token is X then type O and vise versa
#   self.token == "X" ? "O" : "X"
# end
#
# def move(board)
#
#
#     #turn one
#     if !board.taken?(1)
#       return "1"
#     elsif !board.taken?(3)
#       return "3"
#     end
#
#     idx = nil
#     Game::WIN_COMBINATIONS.each do |combo|
#       # binding.pry[0, 3, 9]
#       if board.cells.include?(combo[0]) == token && !board.taken?(combo[1] + 1)
#         idx = combo[1].to_i + 1
#         return idx
#       elsif board.cells.include?(combo[0]) == token && board.cells.include?(combo[1]) == current_player && !board.taken?(combo[2]  + 1)
#         idx = combo[2].to_i + 1
#         return idx
#       end
#     end
#
#     idx.to_s
#   end
# end
# end
# #
module Players
  class Computer < Player

    def move(board)


      if !board.taken?(9)
        "9"
      elsif !board.taken?(1)
        "1"
      elsif !board.taken?(3)
        "3"
      elsif !board.taken?(6)
        "6"
      elsif !board.taken?(2)
        "2"
      elsif !board.taken?(7)
        "7"
      elsif !board.taken?(8)
        "8"
      elsif !board.taken?(4)
        "4"
      elsif !board.taken?(5)
        "5"
      end
    end
  end
end
