class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super (name)
    @life_points  = 100
  end

  def show_state
    puts "#{@player} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end 

  # Chercher une arme (aléatoire)
  def search_weapon
    result = rand(1..6)
    puts "\033[1;35mTu as trouvé une arme de niveau #{result}"+"\033[0m"
    if @weapon_level < result
      puts "Youhouuuu ! Elle est meilleur que ton arme actuelle : tu la prends."
      @weapon_level = result
    else
      puts "F@*#k... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  # Chercher une trousse de secours (aléatoire)
  def search_health_pack
    result = rand(1..6)
    if result == 1
      puts "Tu n'as rien trouvé..."
    elsif result == 6 
      puts "\033[1;32mWaow, tu as trouvé un pack de +80 points de vie !"+"\033[0m"
      @life_points + 80 > 100 ? (@life_points = 100 ) : (@life_points = @life_points + 80)
    else
      puts "\033[1;32mBravo, tu as trouvé un pack de +50 points de vie !"+"\033[0m"
      @life_points + 50 > 100 ? (@life_points = 100) : (@life_points = @life_points + 50)
    end
  end
      
end 