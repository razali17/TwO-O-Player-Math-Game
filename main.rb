require "./Player"

def start
  puts "New Game"
  runGame
end

@player1 = Player.new("player1")
@player2 = Player.new("player2")

@turns = 0

def runGame
  if @turns % 2 == 0 && @player2.alive?
    if @player2.alive?
      puts "----- NEW TURN -----"
      q = Questions.new()
      puts "Player 1: #{q.ask_question}"
      answer = gets.chomp.to_i
      if answer == q.correct_answer
        puts "Player 1: YES! You are correct."
      elsif answer != q.correct_answer
        @player1.lives -= 1
        puts "Player 1: Seriosuly? No!"
      end
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    end
    @turns += 1
    runGame
  elsif @turns % 2 == 1 && @player1.alive?
    if @player1.alive?
      puts "----- NEW TURN -----"
      q = Questions.new()
      puts "Player 2: #{q.ask_question}"
      answer = gets.chomp.to_i
      if answer == q.correct_answer
        puts "Player 2: YES! You are correct."
      elsif answer != q.correct_answer
        @player2.lives -= 1
        puts "Player 2: Seriosuly? No!"
      end
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    end
    @turns += 1
    runGame
  elsif !(@player1.alive?) || !(@player2.alive?)
    if !(@player2.alive?)
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    elsif !(@player1.alive?)
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    end
    puts "------ GAME OVER ------"
    puts "Good bye!"
  end
end

start