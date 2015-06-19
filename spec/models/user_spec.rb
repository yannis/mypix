require 'rails_helper'

RSpec.describe User, type: :model do
  it {is_expected.to validate_presence_of :name}
  it {is_expected.to validate_presence_of :email} # set by devise
  it {is_expected.to validate_presence_of :password} # set by devise
end
