require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'associations' do
    it { should have_many(:replies) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end
end
