# lignes qui appellent les fichiers lib/game.rb et lib/player.rb
require_relative 'lib/game'
require_relative 'lib/player'

# lignes qui appellent les gems
require 'pry'



def play
    # creation de mes 2 joueurs
    player1 = Player.new("josette")
    player2 = Player.new("marcel")
puts "Etat des combatants:"
puts "***************************"
puts ""
print "#{player1.show_state}"
print "#{player2.show_state}"



puts ""
puts "Passons à la phase d'attaque"
puts "***************************"
puts ""
player1.attacks(player2)
player2.attacks(player1)

while player1.life_points> 0 && player2.life_points > 0

    puts player1.attacks(player2)

    break if player1.life_points <= 0 || player2.life_points <= 0

    puts player2.attacks(player1)
    puts ""
    puts "**************"

end
end


play
# binding.pry
