RSpec.describe Page do
  describe "Attributes" do
    it { is_expected.to have_attribute :url }
    it { is_expected.to have_attribute :content }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :url }
    it "expects url is not valid nor accesible" do
      subject = Page.new(url: 'htttp://www.badurl.com')
      #subject.valid?
      # before line fails because spec for 'GET /v1/pages'
      # instead it is used next line
      subject.send(:url_accessible?)
      expect(subject.errors[:url]).to include "is not valid or it cannot be accessed at this moment"
    end
  end

  describe "Callbacks" do
    it "expects to set content attribute before save" do
      subject = Page.new(url: 'http://www.example.com')
      subject.send(:url_accessible?)
      subject.save
      expect(subject.reload.content).not_to be_nil
    end
  end
end
