require 'rails_helper'

describe "visit the home page" do
  it "visits the home page" do
    visit root_path
    expect(page).to have_content 'Shuttr'
  end

end
