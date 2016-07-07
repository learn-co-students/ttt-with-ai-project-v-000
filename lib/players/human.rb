module Players

  class Human < Player

    def move(dummy_arg)
      puts "    player move method"
      a = gets.chomp
      puts "    just got input '#{a}' from player"
      a
    end
  end

end
