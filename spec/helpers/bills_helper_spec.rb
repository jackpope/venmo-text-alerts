require 'rails_helper'

RSpec.describe BillsHelper, type: :helper do
  describe "#plural_ownership" do
    it "returns plural ownership if copayers count is 2 or more" do
      count = rand(2..20)
      string = "copayer"
      expect(helper.plural_ownership(count, string)). to eq("copayers'")
    end

    it "returns singular ownership if copayers count is 1" do
      count = 1
      string = "copayer"
      expect(helper.plural_ownership(count, string)).to eq("copayer's")
    end
  end
end
