require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

 # Lancement de la partie
puts " __________________________________________"
puts "|            Bienvenue à toi               |"
puts "| Pour ressortir vivant de cette aventure  |"
puts "| Vous devrez vaincre tous vos adversaires |"
puts "|                                          |"
puts "|               Let's go                   |"
puts "|__________________________________________|"
puts ""
puts "Quel est ton nom jeune guerrier :"
print "> "
name = gets.chomp
user = HumanPlayer.new(name)

ennemies = []
ennemies << Player.new("Josiane")
ennemies << Player.new("José")



# Combat : lance les méthodes de HumanPlayer(et parent player)
def fight(user, ennemies)
  while user.life_points > 0 && (ennemies[0].life_points > 0 || ennemies[1].life_points > 0)
    puts "___________________________________________"
    puts "\033[1;34mEtat de sante de #{user.player} : #{user.life_points}       ------"+"\033[0m"
    puts "\033[1;34mArme level :             #{user.weapon_level}       ------"+"\033[0m"
    puts "___________________________________________"
    puts "Quelle action veux tu effectuer ?"
    puts ""
    puts "a - chercher une meilleur arme"
    puts "b - chercher une trousse de secours"
    puts ""
    puts "Attaquer un joueur en vue :"
    puts "0 - #{ennemies[0].show_state}"
    puts "1 - #{ennemies[1].show_state}"
    print "> "
    choose = gets.chomp.to_s
    puts ""
    if choose == "a"
      user.search_weapon
    elsif choose == "b"
      user.search_health_pack
    elsif choose == "0"
      user.attacks(ennemies[0])
    elsif choose == "1"
      user.attacks(ennemies[1])
    else
      puts "Fait un effort, fait un choix qui existe..."
    end
    puts ""
    ennemies.each {|ennemie| ennemie.life_points > 0 ? ennemie.attacks(user) : ()}
  end
end

# Fin de partie
def end_game(user)
  if user.life_points > 0 
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


fight(user, ennemies)
end_game(user)







