module Players
  # class Human inherits from Player (root class)
  class Human < Player

    # asks the user for input and returns it
    def move(input ="X")
      input = gets
      input
    end

  end
end
