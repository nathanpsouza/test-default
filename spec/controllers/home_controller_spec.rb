require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "#GET index" do
    let( :courses ) { FactoryGirl::create_list( :course, 2 ) }

    it "populates an array of courses" do
      get :index
      expect( assigns( :courses ) ).to match_array( courses )
    end

    it "renders the :index template" do
      get :index
      expect( response ).to render_template( :index )
    end
  end
end
