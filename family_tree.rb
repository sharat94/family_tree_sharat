require './person'
require './kingdom'
while true # STDIN
  puts 'Enter the name:'
  input_name = gets.strip
  puts 'Enter the relation to be found'
  input_relation = gets.strip

  family_members = []
  family_members = Person.find_relative(input_name, input_relation)
  if family_members.empty?
    puts 'No person/relative found'
  else
    puts "The #{input_relation} of #{input_name} are:"
    family_members.compact.flatten.each{ |member| puts member.name }
    puts '*' * 50
  end
end