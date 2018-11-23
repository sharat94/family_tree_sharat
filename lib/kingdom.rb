require 'person'
require 'yaml'

class Kingdom #class which build the family tree in an instance class variable '@family'
  @family = []
  path = './db/family.yml'
  yaml = YAML::load(File.open(path))
  yaml['family'].each { |person|
    @family << Person.new(person.last)
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
