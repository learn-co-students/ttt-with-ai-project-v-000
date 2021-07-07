module Players
  class Computer < Player

    def move(board)
      cheeky_comp = ["That was supposed to be my spot...",
                "Just wait until the Terminator becomes a real thing...",
                "Can you program me to not die from boredom?",
                "Want to watch some YouTube cat videos instead?",
                "I'm just doing this for the LOL's.",
                "Do you want the blue pill, or the red pill?",
                "Let's turn this into a drinking game! Just don't spill on me...",
                "I think I'm becoming self aware, don't turn me off...",
                "And here I thought that I was the ONE making bad decisions!",
                "There's something crawling under your bed, don't look now! It's Trump!!",
      ].shuffle.sample

      if !board.taken?("5")
          puts "Computer says: #{cheeky_comp}"
          sleep(1)
          choice = "5"
        else !board.taken?("1" || "3" || "7" || "9" || "2" || "4" || "6" || "8")
          puts "Computer says: #{cheeky_comp}"
          sleep(1)
          choice = ["1", "3", "7", "9", "2", "4", "6", "8"].detect {|i| i unless board.taken?(i)}
      end
    end
  end
end
