require 'kingdom'
describe Kingdom do
  describe ".initialize" do
    it "check if the family members have been loaded to class instance variable" do
      family_names = Kingdom.family.map{ |member| member.name }
      expect(family_names.include?("vyan")).to eq true
    end
  end
end