require 'pry'

class Player
    attr_accessor :name
    attr_accessor :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

# methode pour afficher l'état d'un joueur

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

# methode pour afficher les attaques subis

    def gets_damage(number_damage)
        @life_points -= number_damage

        if @life_points <= 0
            puts "#{@name} est mort !!"
        end

    end

# methode pour attaquer player est le joueur subissant l'attaque + dommages aléatoires

    def attacks(player)

        puts "#{@name} attaque #{player.name}"

        damage = compute_damage #recupere la methode

        puts "#{@name} inflige #{damage} points de dommages"

        player.gets_damage(damage)
        # recupere la methode gets_damage et lui attribu le resultat de aléatoire de compute_damage


    end

    def compute_damage
        return rand(1..6)
    end

   
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
    end
# modifie la presentation du joueur en rjoutant les point de vie
    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

# augmenter les dommages
    def compute_damage
        rand(1..6) * @weapon_level
    end

# chercher une arme
    def search_weapon
        weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon}"
        if weapon > @weapon_level
            @weapon_level = weapon
            puts"Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
          puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end  
    end

# chercher un pack de points de vie
    def search_health_pack

        health_pack = rand(1..6)

        case health_pack

        when 1
            puts "Tu n'as rien trouvé... "
        when 2..5
            if @life_points < 50
                @life_points += 50
            else
                @life_points = @life_points + 50 - (@life_points - 50)

            end
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        when 6
            if @life_points < 20
                @life_points += 80
            else
                @life_points = @life_points + 80 - (@life_points - 80)

            end
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end

    end

end

player5 = HumanPlayer.new("flo")

# binding.pry