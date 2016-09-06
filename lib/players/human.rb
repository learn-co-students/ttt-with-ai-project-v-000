#>Note on name spacing: You'll notice here that we do `Players::Human < Player` does not work because the `Players` module is not yet defined. So to do this, we'll need to do:
#```ruby
#module Players
#  class Human < Player
#    # your code here
#  end
#end
#```
#Now when you call your Human class, you'll have to call it inside it's name space with `Players::Human`.

module Players
  #Define a class `Human` that inherits from `Player`. This class should be namespaced inside the module `Players` because the `human.rb` file is inside the `players/` directory. This keeps our code nice and tidy.
  class Human < Player

    def move(board= nil)
      puts "Where would you like to move? Please input a location, 1 - 9"

      input = gets.strip
      input
      #The human player must implement a `#move` method that takes in a `board` argument and allows a human player to ENTER A MOVE VIA THE CLI. The method should RETURN THE VALUE THE USER ENTERS. Even though the method accepts a `board` argument, it does not need to use it.
    end
  end
end
