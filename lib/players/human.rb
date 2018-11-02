##### 'players/human.rb' - `Players::Human`
#Define a class `Human` that inherits from `Player`. This class should be namespaced inside the module `Players` because the
#`human.rb` file is inside the `players/` directory. This keeps our code nice and tidy.

#The human player must implement a `#move` method that takes in a `board` argument and allows a human player to enter a move
#via the CLI. The method should return the value the user enters. Even though the method accepts a `board` argument, it does
#not need to use it.

#Note on namespacing: You'll notice here that if we do `Players::Human < Player` our inheritance won't function properly. This
#is because the `Players` module is not yet defined. So to do this, we'll need to do:
#```ruby
#module Players
#  class Human < Player
#    # your code here
#  end
#end
#```
#Now when you call your Human class, you'll have to call it inside its name space with `Players::Human`.

module Players
  class Human < Player

    def move(board)
      user_move = gets.strip
    end
  end
end
