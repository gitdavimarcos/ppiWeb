require 'spec_helper'

describe "Inscricoes" do
  describe "GET /inscricoes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get inscricoes_path
      response.status.should be(200)
    end
  end
end
