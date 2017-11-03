require 'pry'

module Players
  class Computer < Player
    Players::Computer

    def move(board)
      move = ""


      puts "Please enter a number from 1..9"

      if board.position(5) == " "
      move = "5"
      elsif board.cells[0] == " " || board.cells[2] == " " || board.cells[6] == " " || board.cells[8] == " "
        move = 0
      until board.valid_move?(move)
        move = ["1","3","7","9"][(0..3)].sample

      end
      move


    #binding.pry
  elsif board.cells[0] == token && board.cells[6] == token
        move = 4

         elsif board.cells[2] == board.cells[8] || board.cells[6] == board.cells[8] || board.cells[0] == board.cells[2]
           move = 0
           until board.valid_move?(move)
             move = ["2","4","6","8"][(0..3)].sample
 end
 move
 end
 end
end
end
# #  Game::WIN_COMBINATIONS.each do |win|
# #           win.select do |slot|
# #           if board.position(slot+1) == token && win.any?{ |slot| board.position(slot+1) == " "}
# #               input = win.select{|slot| !board.taken?(slot+1)}.to_s
# #
# # #
# end
