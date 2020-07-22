require 'rails_helper'

RSpec.describe Friend, type: :model do
  context 'validation tests' do
    it 'ensures first name presence' do
      friend = Friend.new(last_name: 'Doe', email: 'test@test.com', status: 'pending').save
      expect(friend).to eq(false)
    end

    it 'ensures last name presence' do
      friend = Friend.new(first_name: 'Jane', email: 'test@test.com', status: 'pending').save
      expect(friend).to eq(false)
    end

    it 'ensures email presence' do
      friend = Friend.new(first_name: 'Jane', last_name: 'Doe', status: 'pending').save
      expect(friend).to eq(false)
    end

    # TODO fix this
    # it 'ensures default status is active' do
    #   friend = Friend.new(first_name: 'Jane', last_name: 'Doe', email: 'test@test.com').save
    #   expect(friend).to eq(true)
    #   expect(friend.status).to eq('active')
    # end

    it 'should save successfully' do
      friend = Friend.new(first_name: 'Jane', last_name: 'Doe', email: 'test@test.com', status: 'pending').save
      expect(friend).to eq(true)
    end
  end

  context 'scope tests' do
    let (:params) { {first_name: 'Jane', last_name: 'Doe', email: 'test@test.com'} }
    # create a bunch of friends with active and pending status
    before(:each) do
      Friend.new(params).save
      Friend.new(params).save
      Friend.new(params.merge(status: 'active')).save
      Friend.new(params.merge(status: 'pending')).save
      Friend.new(params.merge(status: 'pending')).save
    end

    it 'should return active friends' do
      expect(Friend.active_friends.size).to eq(3)
    end

    it 'should return pending friends' do
      expect(Friend.pending_friends.size).to eq(2)
    end
  end
end
