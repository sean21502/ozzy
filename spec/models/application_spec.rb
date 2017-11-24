require 'rails_helper'
require 'faker'

RSpec.describe Application, type: :model do

  let(:name) { Faker::Name.name }
  let(:url) { Faker::Name.name }
 

  let(:application) { Application.create!(name: "New Application Title", url: "New Application Url") }
 
  describe "attributes" do
    it "has name and url attributes" do
      expect(application).to have_attributes(name: "New Application Title", url: "New Application Url")
    end
  end
end
