require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

player1 = Player.new("Antho")
player2 = Player.new("Xab")

while player2.life_points > 0 && player1.life_points > 0
  puts ""
  puts "Voici l'état de chaque joueur :"
  puts "-------------------------------"
  player1.show_state
  player2.show_state
  puts "-------------------------------"
  puts ""
  puts "\033[1;32mXXX  Passons à la phase d'attaque :  XXX"+"\033[0m"
  player2.attacks(player1)
  if player1.life_points <= 0
    break
  else
    player1.attacks(player2)
  end
end

binding.pry
