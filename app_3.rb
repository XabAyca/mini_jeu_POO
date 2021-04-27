require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

#Lancement

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
@my_game = Game.new(name)
@my_game.create_ennemies

# Boucle de lancement des méthodes (seulement l'objet @my_game)

while @my_game.human_player.life_points > 0 && @my_game.ennemies_in_sight.size > 0
  @my_game.new_players_in_sight
  @my_game.show_players
  @my_game.menu
  str = gets.chomp
  @my_game.clear_the_shell
  @my_game.menu_choise(str)
  @my_game.enemies_attack
end

@my_game.end_game
