require "./src/html_helper"
require "rspec"

$test_case_html = <<-HTML
<!DOCTYPE html>
<html>
  <body>
    <h1>Test Case 1</h1>

    <p>I am a paragraph! <a href="javascript:doThing">blah</a></p>

    <p>Sometimes I am <a href="./cynical.html">overly cynical</a>, but sometimes I am
      <a href="./page2.html">overly na&#xEFve.</a></p>
  </body>
</html>
HTML

RSpec.describe HtmlHelper do
  include HtmlHelper

  describe '#clean_up_href' do
    it "removes spaces from hrefs" do
      expect(clean_up_href("http://www.example.com/space url")).to eq("http://www.example.com/space%20url")
    end
  end

  describe '#absolutize_path' do
    base_path = "/base/path/"

    ["/base/path/", "/base/path/foo"].each do |path_to_test|
      describe "with #{base_path}" do
        it "does nothing to absolute paths" do
          expect(absolutize_path("/hello", path_to_test)).to eq("/hello")
        end

        it "affects implicitly relative paths" do
          expect(absolutize_path("hello/what", path_to_test)).to eq(base_path + "hello/what")
        end

        it "affects explicitly relative paths" do
          expect(absolutize_path("./hello/what", path_to_test)).to eq(base_path + "hello/what")
        end

        it "handles .." do
          expect(absolutize_path("../hello/what", path_to_test)).to eq("/base/hello/what")
        end

        it "handles multiple .." do
          expect(absolutize_path("../../hello/what", path_to_test)).to eq("/hello/what")
        end
      end
    end
  end

  describe '#get_paths' do
    it "parses a html page well" do
      result = get_url_strings_from_doc($test_case_html)

      expect(result).to eq(["javascript:doThing", "./cynical.html", "./page2.html"])
    end
  end
end
