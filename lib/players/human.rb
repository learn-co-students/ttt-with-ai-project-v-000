module Players
class Players::Human < Player

  def move(board)
    puts "Enter a number between 1-9"
    user_input = gets.strip
    user_input
  end

end
end
