require 'rails_helper'

RSpec.describe "the Mechanic show page" do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic2 = Mechanic.create!(name: 'John Doe', years_experience: 7)
    @ride1= @mechanic1.rides.create!(name: 'The Frog Hopper', thrill_rating: 4, open: true)
    @ride2= @mechanic1.rides.create!(name: 'Fahrenheit', thrill_rating: 8, open: true)
    @ride3= @mechanic1.rides.create!(name: 'The Kiss Raise', thrill_rating: 5, open: false)
    @ride4= @mechanic2.rides.create!(name: 'The Zipper', thrill_rating: 7, open: true)
  end

  it 'Display mechanics attributes and rides' do
    visit "/mechanics/#{@mechanic1.id}"

    expect(page).to have_content("Name: #{@mechanic1.name}")
    expect(page).to have_content("Years of experience: #{@mechanic1.years_experience}")
    expect(page).to have_content('The Frog Hopper')
    expect(page).to have_content('Fahrenheit')
    expect(page).to_not have_content('The Kiss Raise')
  end


end
