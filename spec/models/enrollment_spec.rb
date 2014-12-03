require 'rails_helper'

RSpec.describe Enrollment, :type => :model do
  it { should belong_to( :student ) }
  it { should belong_to( :course ) }
end
