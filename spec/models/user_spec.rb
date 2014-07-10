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


end
