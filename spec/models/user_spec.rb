require 'rails_helper'

describe User do
  let(:michael) { User.create(username: "MALR", first_name: "Michael", last_name: "Ross", password: "abc", password_confirmation: "abc")}
  let(:mck) { User.create(username: "superman", first_name: "McKenneth", last_name: "Scott", password: "def", password_confirmation: "def") }
  it "is valid when created with a valid username, first name, last name and password" do
    michael = User.create(username: "malr", first_name: "Michael", last_name: "Ross", password: "abc", password_confirmation: "abc")
    expect(michael.valid?).to eq(true)
  end

  it "has a username property" do
    michael = User.create(username: "MALR", first_name: "Michael", last_name: "Ross", password: "abc", password_confirmation: "abc")
    expect(michael.username).to eq("MALR")
  end

  it "validates the presence of the user" do
    michael = User.create(username: nil)
    michael.valid?
    expect(michael.errors.messages[:username].size).to eq(1)
  end


  it { is_expected.to validate_uniqueness_of :username }

  it { is_expected.to have_many :posts }

  it { is_expected.to have_secure_password }

  it { should respond_to(:relationships) }

  it { should respond_to(:followed_users) }

  it { should respond_to(:reverse_relationships) }

  it { should respond_to(:followers)}

  it { should respond_to(:following?) }

  it { should respond_to(:follow!) }

  it { should respond_to(:unfollow!) }

  describe "following" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save
      @user.follow!(other_user)
    end

    # it { should be_following(other_user) }
    # its(:followed_users) { should include(other_user) }

    # describe "followed user" do
    #   subject { other_user }
    #   its(:followers) { should include(@user) }
    # end

    # describe "and unfollowing" do
    #   before { @user.unfollow!(other_user) }
    #
    #   it { should_not be_following(other_user) }
    #   its(:followed_users) { should_not include(other_user) }
    # end
  end


end
