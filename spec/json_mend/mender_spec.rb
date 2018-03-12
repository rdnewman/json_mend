RSpec.describe JsonMend::Mender do
  subject{JsonMend::Mender.new(test_string)}

  describe 'clean' do
    let (:test_string) {"  { hello: 'hello', \"test\": \"test value\" }"}
    it "performs correctly" do
      expected_string = "{\"hello\": \"hello\", \"test\": \"test value\"}"
      expect(subject.mend).to eq(expected_string)
    end
  end
end
