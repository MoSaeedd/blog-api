require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  #it { should validate_presence_of(:image) }
  it { should validate_presence_of(:password_digest) }
end
