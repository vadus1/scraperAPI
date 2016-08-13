RSpec.describe Scraper, :type => :service  do
  it "returns a scraped html" do
    fake_html = <<-EOS
    <!doctype html>
    <html>
    <head>
        <title>Example Domain</title>
    </head>

    <body>
    <div>
        <h1>Example Domain</h1>
        <p>This domain is established to be used for illustrative examples in
        documents. You may use this domain in examples without prior coordination
        or asking for permission.
        </p>
        <p>
          <a href="http://www.iana.org/domains/example">More information...</a>
        </p>
    </div>
    </body>
    </html>
    EOS

    scrap = {
      "a"=>["http://www.iana.org/domains/example"],
      "h1"=>["Example Domain"],
      "h2"=>[],
      "h3"=>[]
    }
    Scraper.any_instance.stubs(:html).returns(fake_html)

    expect(Scraper.new('http://google.com').call.to_hash["a"]).to eq(scrap["a"])
    expect(Scraper.new('http://google.com').call.to_hash["h1"]).to eq(scrap["h1"])
    expect(Scraper.new('http://google.com').call.to_hash["h2"]).to eq(scrap["h2"])
  end
end
