module Players

  class Human < Player

    def move(input)
      input = gets.strip
    end

  end
end

# rspec spec/03_human_player_spec.rb
