require './relation'
require './generation'
require 'pry'

class Person < Generation #defines a person with their respective attributes
  include Relation
  attr_accessor :name, :spouse, :parents, :gender, :generation_stage
  def initialize(person)
    @name = person['name']
    @spouse = person['spouse']
    @parents = person['parents']
    @gender = person['gender']
    super(person['generation_stage'])
  end

  def male?
    self.gender == 'male'
  end

  def female?
    self.gender == 'female'
  end

  def self.find_relative(name, relation)
    person = Kingdom.family.find{ |person| person.name == name}
    if Relation.instance_methods.include?(relation.to_sym) && !person.nil?
      return person.send relation.to_sym
    else
      return []
    end
  end

end
