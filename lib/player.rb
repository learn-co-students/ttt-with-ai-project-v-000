class Player
  attr_reader :token, :name, :results
  @@all = []
  @@results = []

  def initialize(token)
    @token = token
  end

  def name=(name)
    @name = name
    @@all << self if !find_by_name(name)
  end

  def find_by_name(name)
    @@all.detect{|player| player.name == name}
  end

  def find_by_token(token)
    @@all.detect{|player| player.token == token}
  end

  def save_results(token)
    token ? @@results << find_by_token(token).name : @@results << "draw"
  end

  def results
    p1_wins = @@results.count {|result| result == @all[0].name}
    p2_wins = @@results.count {|result| result == @all[1].name}
    draws = @@results.count {|result| result == "draw"}
  end
end
