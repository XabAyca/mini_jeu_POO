class Game
  attr_accessor :human_player, :ennemies_in_sight

  def initialize(name)
    @human_player      = HumanPlayer.new(name)
    @players_left      = 10
    @ennemies_in_sight = []
  end

  def create_ennemies
    @ennemies_in_sight << Player.new("Josiane")
    @ennemies_in_sight << Player.new("José")
    @ennemies_in_sight << Player.new("Martin")
    @ennemies_in_sight << Player.new("Marie")
  end

  def new_players_in_sight
    if @ennemies_in_sight.size >= @players_left
      puts ""
      puts "Tous les joueurs sont déjà en vue" 
    else
      result = rand(1..6)
      if result == 1
        puts ""
        puts "Pas d'ennemies supplémentaires à l'horizon pour l'instant"
      elsif result == 5 || result == 6
        2.times {|i| @ennemies_in_sight << Player.new("bots-#{rand(1..999)}")}
        puts ""
        puts "\033[1;31mAttention 2 nouveaux ennemis approchent ..."+"\033[0m"
      else
        1.times {|i| @ennemies_in_sight << Player.new("bots-#{rand(1..999)}")}
        puts ""
        puts "\033[1;31mAttention 1 nouvel ennemi approche ..."+"\033[0m"
      end
    end
  end

  def kill_player(player)
    @ennemies_in_sight.delete(player)
  end

  def is_still_ongoing?
    puts @human_player.life_points > 0 && @ennemies_in_sight.size > 0
  end

  def show_players
    puts ""
    puts "___________________________________________"
    puts "\033[1;34mEtat de santé de #{@human_player.player} : #{@human_player.life_points}       ------"+"\033[0m"
    puts "\033[1;34mArme level             : #{@human_player.weapon_level}       ------"+"\033[0m"
    puts "___________________________________________"
    puts ""
    puts "Il reste #{@ennemies_in_sight.size} ennemies à vaincre !!!"
    puts ""
  end

  def menu
    puts "Quelle action veux tu effectuer ?"
    puts ""
    puts "a - chercher une meilleur arme"
    puts "b - chercher une trousse de secours"
    puts ""
    puts "Attaquer un joueur en vue :"
    @ennemies_in_sight.size.times do |i|
      @ennemies_in_sight[i].life_points > 0 ? (puts "#{i} - #{@ennemies_in_sight[i].show_state}") : ()
    end
    puts ""
    print "> "
  end

  def menu_choise(str)
    puts "============================================"
    @ennemies_in_sight.each {|ennemie| ennemie.life_points < 0 ? (kill_player(ennemie)) : ()}
    if str == "a"
      @human_player.search_weapon
    elsif str == "b"
      @human_player.search_health_pack
    else 
      str = str.to_i
      @human_player.attacks(@ennemies_in_sight[str])
    end
    puts ""
  end

  def enemies_attack
    @ennemies_in_sight.each {|ennemie| ennemie.life_points > 0 && @human_player.life_points > 0 ? (ennemie.attacks(@human_player)) : (kill_player(ennemie))}
  end

  def end_game
    if @human_player.life_points > 0 
      puts ""
      puts "\033[1;32mBRAVO TU AS GAGNÉ ! Tu es le dernier survivant... Tu peux rentrer chez toi"+"\033[0m"
      puts "\033[1;32mTu n'as rien gagné  mis à part de gros soucis psycho "+"\033[0m"
      puts ""
    else
      puts ""
      puts "\033[1;31mYOU ARE DEAD !!!!!"+"\033[0m"
      puts ""
    end
  end

  def clear_the_shell
    system('clear')
  end

end

