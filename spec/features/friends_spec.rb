require 'rails_helper'

RSpec.describe "Friends Page", type: :feature do

  before do
    Friend.create!(first_name: 'Joe', last_name: 'Smith', email: 'jsmith@foo.com')
    Friend.create!(first_name: 'Ann', last_name: 'Lee', email: 'alee@foo.com')
  end

  scenario 'User sees a list of their friends' do
    visit '/friends'
    expect(page).to have_text('Joe Smith')
    expect(page).to have_text('Ann Lee')
  end

  scenario 'User can go to new friend page via the index page' do
    visit '/friends'
    expect(page).to have_link('New Friend')
    click_link('New Friend')
    expect(page).to have_text('New Friend')
  end

  scenario 'User can create a new friend' do
    visit '/friends/new'
    # expect(page).to have_text('Joe Smith')
    # expect(page).to have_text('Ann Lee')
  end

end
