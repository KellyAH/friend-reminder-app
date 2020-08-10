require 'rails_helper'

# Test that model can talk to DB.
RSpec.describe Friend, type: :model do
  context 'validation tests' do
    it 'ensures first name presence' do
      record_created = Friend.new(last_name: 'Doe', email: 'test@test.com', status: 'pending').save
      expect(record_created).to eq(false)
    end

    it 'ensures last name presence' do
      record_created = Friend.new(first_name: 'Jane', email: 'test@test.com', status: 'pending').save
      expect(record_created).to eq(false)
    end

    it 'ensures email presence' do
      record_created = Friend.new(first_name: 'Jane', last_name: 'Doe', status: 'pending').save
      expect(record_created).to eq(false)
    end

    it 'ensures default status is active' do
      record_created = Friend.new(first_name: 'Jane', last_name: 'Doe', email: 'foobar@foo.com').save
      expect(record_created).to eq(true)
      expect(Friend.first.status).to eq('active')
    end

    it 'should save successfully' do
      record_created = Friend.new(first_name: 'Jane', last_name: 'Doe', email: 'test@test.com', status: 'pending').save
      expect(record_created).to eq(true)
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
