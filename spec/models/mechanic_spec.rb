require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many :mechanic_rides}
    it {should have_many(:rides).through(:mechanic_rides)}
  end

  describe 'methods' do
    before :each do
      @mechanic1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
      @mechanic2 = Mechanic.create!(name: 'John Doe', years_experience: 7)
    end

    it 'averages years of experience' do
      expect(Mechanic.average_experience).to eq(9)
    end
  end 
end
