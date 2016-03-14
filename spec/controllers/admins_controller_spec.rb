require "rails_helper"

RSpec.describe AdminsController, :type => :controller do
  describe "POST #create" do
    it "crea un resto y subscripcion" do

      post :create , Admin.create(email: "sebaitu1111@gmail.com", password:31893189)

      expect(response.resto).to be_a_new(Resto)

    end
  end
end
