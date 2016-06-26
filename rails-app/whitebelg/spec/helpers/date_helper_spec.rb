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
    before { Timecop.travel(2014, 10, 30) }
    after  { Timecop.return }
    it {
      expect(helper.date_format(Date.today)).to eq "2014年の10月30日です"
    }
  end
end
