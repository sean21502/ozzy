require 'rails_helper'

RSpec.describe Application, type: :model do

  let(:name) { RandomData.random_sentence }
  let(:url) { RandomData.randoom_url }
 

  let(:application) { Application.create!(name: "New Application Title", url: "New Application Url") }
 
  describe "attributes" do
    it "has name and url attributes" do
      expect(application).to have_attributes(name: "New Application Title", url: "New Application Url")
    end
  end
end
