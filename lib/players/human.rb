# Define a class `Human` that inherits from `Player`.
# This class should be namespaced inside the module `Players`
# because the `human.rb` file is inside the `players/` directory.
# This keeps our code nice and tidy.
#
# The human player must implement a `#move` method that takes in
# a `board` argument and allows a human player to enter a move
# via the CLI. The method should return the value the user enters.
# Even though the method accepts a `board` argument,
# it does not need to use it.

module Players
  class Human < Player

  end
end
