require "rspec_api_documentation_helper"

RSpec.resource "Pages" do
  header "Content-Type", "application/vnd.api+json"

  post "/v1/pages" do
    parameter "type", <<-DESC, required: true
      The type of the resource. Must be pages.
    DESC

    let "type" do
      "pages"
    end

    parameter "url", <<-DESC, scope: :attributes, required: true
      The url of the page.
    DESC

    let "url" do
      "https://www.ruby-lang.org/es/"
    end

    example_request "POST /v1/pages" do
      expect(status).to eq 201
      page = JSON.parse(response_body)
      expect(page["data"]["attributes"]["url"]).to eq send("url")
    end
  end

  get "/v1/pages" do
    before do
      2.times do
        FactoryGirl.create(:page)
      end
    end
    example_request "GET /v1/pages" do
      expect(status).to eq 200
      pages = JSON.parse(response_body)
      expect(pages["data"].size).to eq 2
    end
  end
end
