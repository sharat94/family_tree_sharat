require 'kingdom'
require 'relation'
require 'person'
describe Relation do #indicative of the different tests that can be written for different relations
  describe ".sons" do
    it "check if the sons listed are accurate" do
      actual_members = Person.find_relative('shan', 'sons')
      actual_member_names = actual_members.compact.flatten.map{ |member| member.name }
      expect(actual_member_names).to match_array(["ish", "chit", "vich"])
    end
  end
  describe ".grandsons" do
    it "check if the grandsons listed are accurate" do
      actual_members = Person.find_relative('shan', 'grandsons')
      actual_member_names = actual_members.compact.flatten.map{ |member| member.name }
      expect(actual_member_names).to match_array(["drita", "vrita", "vila", "savya", "saayan"])
    end
  end
  describe ".spouse" do
    it "check if the spouse listed are accurate" do
      spouse = Person.find_relative('shan', 'spouse')
      expect(spouse.last.name).to eq("anga")
    end
  end

  describe ".brothers_in_law" do
    it "check if the brothers in law listed are accurate" do
      actual_members = Person.find_relative('ish', 'brothers_in_law')
      actual_member_names = actual_members.compact.flatten.map{ |member| member.name }
      expect(actual_member_names).to match_array(["vyan"])
    end
  end
  describe ".cousins" do
    it "check if the cousins listed are accurate" do
      actual_members = Person.find_relative('chika', 'cousins')
      actual_member_names = actual_members.compact.flatten.map{ |member| member.name }
      expect(actual_member_names).to match_array(["drita", "vrita", "satvy", "savya", "saayan"])
    end
  end
  describe ".uncles" do
    it "check if the uncles listed are accurate" do
      actual_members = Person.find_relative('chika', 'uncles')
      actual_member_names = actual_members.compact.flatten.map{ |member| member.name }
      expect(actual_member_names).to match_array(["ish", "chit"])
    end
  end
  describe ".aunts" do
    it "check if the uncles listed are accurate" do
      actual_members = Person.find_relative('chika', 'aunts')
      actual_member_names = actual_members.compact.flatten.map{ |member| member.name }
      expect(actual_member_names).to match_array(["satya"])
    end
  end
  describe ".grandparents" do
    it "check if the grandparents listed are accurate" do
      actual_members = Person.find_relative('kriya', 'grandparents')
      actual_member_names = actual_members.compact.flatten.map{ |member| member.name }
      expect(actual_member_names).to match_array(["satya", "vyan"])
    end
  end
end