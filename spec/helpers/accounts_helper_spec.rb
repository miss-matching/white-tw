require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the AccountsHelper. For example:
#
# describe AccountsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe AccountsHelper do
  # ここまで書かなくていいよね(w
  describe "prefixe_screen_name" do
    it "returns @screen_name" do
      expect( prefix_screen_name( 'hoge' ) ).to eq( '@hoge' )
    end
  end
end
