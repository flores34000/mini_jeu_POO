require_relative 'lib/game'
require_relative 'lib/player'

require 'pry'

puts "#################################################"
puts "Bienvenue sur 'ILS VEULENT TOUS MA POO' !      "
puts "Le but du jeu est d'être le dernier survivant !"
puts "#################################################"

puts ""
puts ""
puts "Ton prénon ?"
prenom = gets.chomp
user = HumanPlayer.new(prenom)

player1 = Player.new("josette")
player2 = Player.new("marcel")

enemies = []
enemies.push(player1,player2)

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0) 

   puts "\033[31m"+"*****************************************"  +"\033[0m"

    puts "info sur ton status :"
    puts user.show_state
   puts "\033[31m"+"*****************************************"+"\033[0m"
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a -chercher une meilleure arme"
    puts "s -chercher à se soigner"
    puts ""
    puts "ou attaquer un joueur  en vu :"
    puts ""
    puts "0 - #{player1.name} a #{player1.life_points} points de vie."
    puts "1 - #{player2.name} has #{player2.life_points} points de vie."
    puts "\033[31m"+"*****************************************"+"\033[0m"
    puts "votre choix"
    choix = gets.chomp
    puts ""
   
    if choix == "a"
      user.search_weapon
    elsif choix == "s"
      user.search_health_pack
    elsif choix == "0"
      user.attacks(player1)
    elsif choix == "1"
      user.attacks(player2)
    end




  end

 puts "La partie est finie" 
 if user.life_points != 0
    puts "*******************"
    puts "BRAVO #{prenom} ! TU AS GAGNE !"
 else
    puts "*******************"
    puts "#{prenom} Tu as perdu !"
 end

