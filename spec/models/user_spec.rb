require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should_not allow_value('blah').for(:email) }
  it { should allow_value('fakeEmail@testing.me').for(:email) }

  it { should have_many(:projects).dependent("destroy") }
  it { should have_many(:entries).dependent("destroy") }
  it { should have_many(:goals).dependent("destroy") }

  it { should respond_to(:type_is) }
  it { should respond_to(:desired_timeframe) }

  it { should respond_to(:total_time_writing_this_week) }
  it { should respond_to(:total_time_writing) }
  it { should respond_to(:hours_or_times) }
  it { should respond_to(:most_recent_goal) }
  it { should respond_to(:spark_line) }
  it { should respond_to(:deadlines) }

  describe 'valid Model' do
    it 'should be an instance of User Model' do
      expect(user).to be_an_instance_of(User)
    end

    it 'should have a password length btwn 6..40' do
      expect(user.password.length).to be > 6
      expect(user.password.length).to be < 40
    end

    it 'should validate_uniqueness_of email' do
      faked_password = Faker::Internet.password
      expect {
        create(:user, email: user.email, password: faked_password,
         password_confirmation: faked_password)
        }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'roles' do
    skip 'add_role :admin method should work' do
      user.add_role :admin
      expect(user.has_role?(:admin)).to be(true)
    end
  end

  describe '#send_reset_password_instructions' do
    skip 'send reset password instructions' do
    end
  end

  describe '#send_confirmation_instructions' do
    skip 'send confirmation instructions' do
    end
  end
end
