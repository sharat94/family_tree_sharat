module Relation
require 'pry'
  def sons
    sons = []
    Kingdom.family.each do |person|
      sons << person if ( person.gender == 'male' &&
                          person.parents.include?(self)
                        )
    end
    sons
  end

  def uncles
    uncles = []
    Kingdom.family.each do |person|
      uncles << person if ( person.gender == 'male' &&
                          person.parents.include?(self)
                        )
    end
    uncles
  end

  def brothers_in_law
    brothers_in_law = []
    Kingdom.family.each do |person|
      brothers_in_law << person.spouse if (
                                          person.brothers.include?(self) &&
                                          person.female?
                                         )
    end
    brothers_in_law
  end

  def sisters_in_law
    sisters_in_law = []
    Kingdom.family.each do |person|
      sisters_in_law << person.spouse if (
                                          person.sisters.include?(self) &&
                                          person.male?
                                         )
    end
    sisters_in_law
  end

  def daughters
    daughters = []
    Kingdom.family.each do |person|
      daughters << person if ( person.gender == 'female' &&
                               person.parents.include?(self)
                             )
    end
    daughters
  end

  def children
    children = []
    Kingdom.family.each do |person|
      children << person if (
                              person.parents.include?(self)
                            )
    end
    children
  end

  def sisters
    sisters = []
    Kingdom.family.each do |person|
      sisters << person if ( person.female? &&
                              person.parents.include?(self.parents.last)
                            )
    end
    sisters
  end

  def brothers
    brothers = []
    Kingdom.family.each do |person|
      brothers << person if ( person.male? &&
                              person.parents.include?(self.parents.last)
                            )
    end
    brothers
  end

  def grandchildren
    grandchildren = []
    Kingdom.family.each do |person|
      grandchildren << person.children if person.parents.include?(self)
    end
    grandchildren
  end

  def grandsons
    grandsons = []
    Kingdom.family.each do |person|
      grandsons << person.sons if person.parents.include?(self)
    end
    grandsons
  end

  def granddaughters
    granddaughters = []
    Kingdom.family.each do |person|
      granddaughters << person.daughters if person.parents.include?(self)
    end
    granddaughters
  end

  def cousins
    cousins = []
    Kingdom.family.each do |person|
      cousins << person if (
                            person.parents.length > 1 &&
                            person.generation_stage == self.generation_stage &&
                            person.parents != self.parents
                           )
    end
    cousins.reject! { |cousin| cousin.name == self.name }
    cousins
  end

  def siblings
    siblings = []
    Kingdom.family.each do |person|
      siblings << person if (
                              person.parents.include?(self.parents.last)
                            )
    end
    siblings
  end

  def spouse
    spouse = []
    Kingdom.family.each do |person|
      spouse << person if (
                            self.spouse == person.name
                          )
    end
    spouse
  end

  def grandparents
    grandparents = []
    Kingdom.family.each do |person|
      grandparents << person.parents if (
                                  self.parents.include?(person)
                                )
    end
    grandparents
  end

end
