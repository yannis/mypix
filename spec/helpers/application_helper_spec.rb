require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:pic) {create :pic}
  let(:form) {form_for(pic){|f| return f}}

  it {expect(helper.devise_mapping.class_name).to eql "User"}
  it {expect(helper.resource_name).to eql :user}
  it {expect(helper.resource_class).to eql User}
  it {expect(helper.submit_or_cancel_form(form)).to eql "<input type=\"submit\" name=\"commit\" value=\"Update Pic\" class=\"btn btn-success\" /> or <a accesskey=\"ESC\" title=\"Cancel pic form\" class=\"cancel \" href=\"/\">cancel</a>"}
end
