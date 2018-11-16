require './person'
require 'yaml'
require 'pry'
puts 'Enter the name:'
input_name = gets.strip
puts 'Enter the relation to be found'
input_relation = gets.strip

class Kingdom
  @family = []
  path = './db/family.yml'
  yaml = YAML::load(File.open(path))
  yaml['family'].each { |person|
    @family << Person.new(person)
  }
  @family.each do |person|
    person.parents.map! do |parent|
      @family.find{ |person| person.name == parent}
    end
  end
  class << self
    attr_accessor :family
  end
end

family_members = []
family_members = Person.find_relative(input_name.last, input_relation)
if family_members.empty?
  puts 'No person/relative found'
else
  family_members.compact.flatten.each{ |member| puts member.name }
end
