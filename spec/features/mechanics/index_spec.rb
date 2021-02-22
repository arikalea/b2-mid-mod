require 'rails_helper'

RSpec.describe "the Mechanic index page" do
  before :each do
    @mechanic1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic2 = Mechanic.create!(name: 'John Doe', years_experience: 7)
  end

  it 'Display header and list of mechanics with attributes' do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("Name: #{@mechanic1.name}")
    expect(page).to have_content("Years of experience: #{@mechanic1.years_experience}")
    expect(page).to have_content("Name: #{@mechanic2.name}")
    expect(page).to have_content("Years of experience: #{@mechanic2.years_experience}")
  end

  it 'Display average years of experiences for all mechanics' do
    visit '/mechanics'

    expect(page).to have_content("Average years of experience for all: 9")
  end
end
