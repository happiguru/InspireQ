require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:relationships) }
    it { should have_many(:reverse_relationships).class_name('Relationship') }
    it { should have_many(:quotes) }
    it { should have_many(:replies) }
    it { should have_many(:likes) }
  end
end
