require_relative 'relation'
require_relative 'generation'
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

  def self.find_gender(relation)
    return 'male' if relation == 'son'
    return 'female' if relation == 'daughter'
    nil
  end

  def self.find_maximum_girl_child
    mothers_hash = {}
    Kingdom.family.each do |member|
      if member.female? && (!member.mother.nil?)
        mothers_hash[member.mother.name] = 0 if mothers_hash[member.mother.name].nil?
        mothers_hash[member.mother.name] += 1
      end
    end
    mothers_hash.each { |mother, count| puts mother if count == mothers_hash.values.max }
  end

  def self.find_relation(name, relative_name)
    person = Kingdom.family.find{ |person| person.name == name}
    relative = Kingdom.family.find{ |person| person.name == relative_name}
    return [] if person.nil? && relative.nil?
    Relation.instance_methods.each do |relation|
      relatives = person.send relation
      return [relation.to_s] if !relatives.nil? && relatives.include?(relative)
    end
    return []
  end

  def self.add_new_relative(name, relation, child)
    parents = []
    single_parent = Kingdom.family.find{ |person| person.name == name}
    other_parent = single_parent.find_spouse.last
    person_hash = {
      'name' => child,
      'spouse' => nil,
      'gender' => find_gender(relation),
      'parents' => [single_parent, other_parent]
    }
    Kingdom.family.push(Person.new(person_hash))
  end

  def self.find_relative(name, relation)
    person = Kingdom.family.find{ |person| person.name == name}
    if Relation.instance_methods.include?(relation.to_sym) && !person.nil?
      return person.send :find_spouse if relation == 'spouse'
      return person.send relation.to_sym
    else
      return []
    end
  end

end
