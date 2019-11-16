require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should belong_to(:post) }
  it { should validate_presence_of(:content) }
end
