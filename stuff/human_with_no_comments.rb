module Players

  class Human < Player

    def move(dummy_arg)
      gets.chomp
    end
  end

end
