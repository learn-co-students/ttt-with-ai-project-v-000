
module Players
  class Human < Player

    def move(board)
      puts "Please enter 1-9:"
      gets.strip
    end
  end
end




















# module Players
# #module holds Human & Computer class. Both classes are children of the Player
# #class and inherit the Player class which only contains an initialize method
# #that initializes Human and Comp. classes with a token: "X" || "O"
# #Player class is not a real player, It only acts as an inheritance point that
# #connects the Player and Computer classes by initializing both of them with said token
#   class Human < Player
# #when instantiating a new Human player instance of Computer player instance
# #you will need to use the Players::Human namespace, such as
# # Players::Humans.new - this will create a human player instance that is
# #initialized with a token from Player class and has access to the #move method
# #below

#     #argument is for the game board. i.e., given this board,
#     #what is your next move, however, the argument does not need to be used.
#     #The move method requests a move from user
#     #then holds and returns that answer in argument
#     #board to use in another method
#     def move(board)
#       puts "please enter 1-9:"
#       gets.strip
#     end
#   end
# end
