module Players
  class Human < Player
    def move(board)
      gets.strip
    end
  end
end

# BACKUP
# module Players
#   class Human < Player
#     def move(board)
#       gets.strip
#     end
#   end
# end
