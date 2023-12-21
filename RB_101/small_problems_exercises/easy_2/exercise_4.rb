def retirement_time
  puts 'What is your age?'
  current_age = gets

  puts 'At what age would you like to retire?'
  retirement_age = gets

  current_year = Time.now.year
  years_to_retire = (retirement_age.to_i - current_age.to_i)
  retirement_year = current_year + years_to_retire

  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{years_to_retire} years of work to go!"
end

retirement_time
