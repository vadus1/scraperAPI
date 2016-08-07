RSpec.describe Page do
  describe "Attributes" do
    it { is_expected.to have_attribute :url }
    it { is_expected.to have_attribute :content }
  end
end
