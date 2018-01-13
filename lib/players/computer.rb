module Players
#======================AI======================
  class Joshua < Player
    def move(board)
      puts "AI is thinking...".red
      rand(1..9).to_s
    end
  end
#==============================================
end
