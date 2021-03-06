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
      @ride1= @mechanic1.rides.create!(name: 'The Frog Hopper', thrill_rating: 4, open: true)
      @ride2= @mechanic1.rides.create!(name: 'Fahrenheit', thrill_rating: 8, open: true)
      @ride3= @mechanic1.rides.create!(name: 'The Kiss Raise', thrill_rating: 5, open: false)
      @ride4= @mechanic2.rides.create!(name: 'The Zipper', thrill_rating: 7, open: true)
    end

    it 'averages years of experience' do
      expect(Mechanic.average_experience).to eq(9)
    end

    it 'Displays rides in order of thrill' do
      expect(@mechanic1.thrill_order[0].name).to eq(@ride2.name)
      expect(@mechanic1.thrill_order[1].name).to eq(@ride1.name)
    end
  end
end
