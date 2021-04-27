class Player
  attr_accessor :player, :life_points

  def initialize(name)
    @player       = name.to_s
    @life_points  = 10  
  end

  #Stats de chaque perso
  def show_state
    @life_points > 0 ? ("#{@player} a #{@life_points} point(s) de vie.") : ("Le joueur #{@player} est mort...")
  end

  # Déduire les dégats
  def gets_damage(damages)
    @life_points = @life_points - damages
    if @life_points <= 0
      puts "\033[4;31mLe joueur #{@player} est mort !"+"\033[0m"
    end
  end

  # Méthode PVP
  def attacks(player_attacked)
    puts "Le joueur #{@player} attaque le joueur #{player_attacked.player}"
    damages=compute_damage()
    puts "Il lui inflige #{damages} point(s) de dommage(s) \033[1;31mo=|===>"+"\033[0m"
    player_attacked.gets_damage(damages)
  end

  def compute_damage
    return rand(1..6)
  end

end