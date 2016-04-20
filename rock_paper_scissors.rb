VALID_CHOICES = %W(rock paper scissors spock lizard)

def prompt(message)
	Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
      (first == 'paper' && second == 'rock') ||
      (first == 'scissors' && second == 'paper') ||
      (first == 'rock' && second == 'lizard') ||
      (first == 'spock' && second == 'scissors') ||
      (first == 'scissors' && second == 'lizard') ||
      (first == 'lizard' && second == 'paper') ||
      (first == 'paper' && second == 'spock') ||
      (first == 'lizard' && second == 'spock')
end

def input_choice(ic)
  letter = case ic
            when 'r'
              "rock"
            when 'l'
              "lizard"
            when 'p'
              "paper"
            when "s"
              prompt("scissors or spock?")
              choice = Kernel.gets().chomp()
            end
  letter
end


def display_results(player, computer)
  if win?(player, computer)
      prompt("You won!")
  elsif win?(computer, player)
      prompt("Computer won !")   
  else
    prompt("Its a tie.")     
  end
end

loop do
  choice = ''
  loop do 
  	prompt("Choose one: #{VALID_CHOICES.join(', ')} (r for rock, p for Paper, l for lizard, s for scissors, s for spock)")
  	choice = Kernel.gets().chomp()

    choice = input_choice(choice)

  	if VALID_CHOICES.include?(choice)
  		break
  	else
  		prompt("Thats not a valid choice.")
  	end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose #{choice}; Computer chose: #{computer_choice}")

  display_results(choice,computer_choice)

  prompt("Do you want to play again? (y) ")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank for playing.")