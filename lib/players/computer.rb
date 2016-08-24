require "pry"
  class Players::Computer < Player
    def move(board)
      #board.cells
      #binding.pry
      puts "Coumputer is scratching it's head"
      sleep 1
      print"."
      sleep 1
      print"."
      sleep 1
      print"."
      puts "\r" , "\r"
      #puts "Got a great idea!"

      move_array = ["1","5","2","4","7","3","8","9","6"]
      move_array.detect {|position| board.valid_move?(position)}
    end
  end
