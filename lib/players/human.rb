module Players
  class Human < Player

    def move(board)
      puts "Please choose a move by choosing a number."
      input = gets.strip
    end
  end
end

# class Human < Player
#
#   def move(board)
#     puts "Please choose a move by choosing a number."
#     input = gets.strip
#     input
#   end
#
# end

# class Player::Human < Player
#   module Players
#     class Human < Player
#
#       def move(board)
#         puts "Please enter 1-9:"
#         gets.strip
#       end
#     end
#   end
# end
