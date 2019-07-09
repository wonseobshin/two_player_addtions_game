class Player
    attr_accessor :health, :num
    def initialize(num)
        @num = num
        @health = 3
    end

    def decrease_health()
        @health = @health -1
    end
end

class Game
    attr_accessor :current_player, :player_one, :player_two

    def initialize
        @player_one = Player.new(1)
        @player_two = Player.new(2)
        @current_player = @player_one
        start
    end

    def get_question
        num_one = Random.rand(10)
        num_two = Random.rand(10)

        question = "What's #{num_one} plus #{num_two}?"
        answer = num_one + num_two

        { question: question, answer:answer }
    end

    def swap_player
        if current_player == player_one 
            @current_player = player_two
        else 
            @current_player = player_one
        end
    end

    def start
        until player_two.health == 0 || player_one.health == 0 
            
            puts "it's Player #{current_player.num}'s turn"
            puts "-------------------------"

            question_answer = get_question
            question = question_answer[:question]
            answer = question_answer[:answer]
            puts question

            guess = gets.chomp.to_i

            if guess == answer 
                puts "Nice."
            else
                puts "Sorry, too bad."
                current_player.decrease_health
            end

            puts "P1: #{player_one.health}/3       P2: #{player_two.health}/3"

            swap_player
        end

        if player_one.health > 0
            puts "PLAYER 1 WINS!"
        else
            puts "PLAYER 2 WINS!"
        end
    end
end

# player_1 = Player.new(1)
# player_2 = Player.new(2)
game = Game.new()
# puts player_1.health
# player_2.decrease_health()
# puts player_2.health

