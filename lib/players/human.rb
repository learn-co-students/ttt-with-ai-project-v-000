
module Players
  class Human < Player

    def move(board)
      puts "Please enter your move"
      gets.strip
    end

  end
end


# rspec spec/03_human_player_spec.rb
