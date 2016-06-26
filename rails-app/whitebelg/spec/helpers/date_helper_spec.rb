require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DateHelper. For example:
#
# describe DateHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DateHelper, :type => :helper do
  describe '#date_format' do
    it {
      expect(helper.date_format(Date.today)).to eq "2016年の06月26日です"
    }
  end
end
