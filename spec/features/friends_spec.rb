require 'rails_helper'
require 'faker'

RSpec.describe "Friends Page", type: :feature do

  before do
    Friend.create!(first_name: 'Joe', last_name: 'Smith', email: 'jsmith@foo.com')
    Friend.create!(first_name: 'Ann', last_name: 'Lee', email: 'alee@foo.com')
  end

  scenario 'User sees a list of their friends' do
    visit '/friends'
    expect(page).to have_text('Joe Smith')
    expect(page).to have_text('Ann Lee')
    links = %w(Show Edit Destroy)
    check_array_of_text_exists(links)
  end

  scenario 'User can go to new friend page via the index page' do
    visit '/friends'
    expect(page).to have_link('New Friend')
    click_link('New Friend')
    expect(page).to have_text('New Friend')
  end

  scenario 'User can create a new friend' do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    visit '/friends/new'
    fill_in('friend_first_name', with: first_name)
    fill_in('friend_last_name', with: last_name)
    fill_in('friend_email', with: email)
    choose('friend_status_pending')
    click_button('Create Friend')
    expect(page).to have_text('Friend was successfully created.')
    click_link('Back')
    expect(page).to have_text(email)
  end

  scenario 'User can create a new friend' do
    visit '/friends/new'
    click_button('Create Friend')
    errors_message = ["First name can't be blank","Last name can't be blank", "Email can't be blank"]
    check_array_of_text_exists(errors_message)
  end

  def check_array_of_text_exists(array)
    array.each {|item| expect(page).to have_text(item)}
  end
end
