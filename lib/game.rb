class Game
  attr_accessor :human_player, :ennemies

  def initialize(name)
    @human_player   = HumanPlayer.new(name)
    @ennemies       = []
  end

  def create_ennemies
    ennemie1 = Player.new("Josiane")
    @ennemies << ennemie1
    ennemie2 = Player.new("José")
    @ennemies << ennemie2
    ennemie3 = Player.new("Martin")
    @ennemies << ennemie3
    ennemie4 = Player.new("Marie")
    @ennemies << ennemie4
  end

  def kill_player(player)
    @ennemies.delete(player)
  end

  def is_still_ongoing?
    puts @human_player.life_points > 0 && @ennemies.size > 0
  end

  def show_players
    puts ""
    puts "#{@human_player.player} a #{@human_player.life_points} point(s) de vie et une arme de niveau #{@human_player.weapon_level}."
    puts ""
    puts "Il reste #{@ennemies.size} ennemies à vaincre !!!"
    puts ""
  end

  def menu
    puts "___________________________________________"
    puts "\033[1;34mEtat de sante de #{@human_player.player} : #{@human_player.life_points}       ------"+"\033[0m"
    puts "___________________________________________"
    puts "Quelle action veux tu effectuer ?"
    puts ""
    puts "a - chercher une meilleur arme"
    puts "b - chercher une trousse de secours"
    puts ""
    puts "Attaquer un joueur en vue :"
    @ennemies.size.times do |i|
      @ennemies[i].life_points > 0 ? (puts "#{i} - #{@ennemies[i].show_state}") : ()
    end
    puts ""
  end

  def menu_choise(str)
    if str == "a"
      @human_player.search_weapon
    elsif str == "b"
      @human_player.search_health_pack
    elsif str == "0"
      @human_player.attacks(@ennemies[0])
    elsif str == "1"
      @human_player.attacks(@ennemies[1])
    elsif str == "2"
      @human_player.attacks(@ennemies[2])
    elsif str == "3"
      @human_player.attacks(@ennemies[3])
    else
      puts "Fait un effort, fait un choix qui existe..."
    end
    puts ""
  end

  def enemies_attack
    @ennemies.each {|ennemie| ennemie.life_points > 0 ? (ennemie.attacks(@human_player)) : (kill_player(ennemie))}
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

end

