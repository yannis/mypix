require 'rails_helper'

RSpec.describe Pic, type: :model do
  it {is_expected.to belong_to :user}
  it {is_expected.to validate_presence_of :title}
  it {is_expected.to respond_to :exifs}

  context "a pic instance" do
    let(:pic) {create :pic}

    it {expect(pic.exifs.to_s).to eql "{\"content_type\"=>\"image/jpeg\", \"width\"=>\"1000\", \"height\"=>\"600\", \"model\"=>nil, \"time\"=>nil, \"exposure\"=>\"\", \"f_number\"=>\"0.0\"}"}
  end
end
