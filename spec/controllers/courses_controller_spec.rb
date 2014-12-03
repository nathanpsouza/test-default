require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

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

  describe "#GET show" do
    let( :course ) { FactoryGirl::create( :course ) }

    it "assigns the requested course to @course" do
      get :show, id: course
      expect( assigns(:course) ).to eq( course )
    end

    it "renders the :show template" do
      get :show, id: course
      expect( response ).to render_template( :show )
    end
  end

  describe "#GET new" do
    it "assigns a new course to @course" do
      get :new
      expect( assigns( :course ) ).to be_a_new( Course )
    end

    it "renders the :new template" do
      get :new
      expect( response ).to render_template( :new )
    end
  end

  describe 'GET #edit' do
    let( :course ) { FactoryGirl::create( :course ) }

    it "assigns the requested course to @course" do
      get :edit, id: course
      expect( assigns( :course ) ).to eq( course )
    end

    it "renders the :edit template" do
      get :edit, id: course
      expect( response ).to render_template( :edit )
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new course" do
        expect {
          post :create, course: FactoryGirl.attributes_for( :course )
        }.to change( Course, :count ).by( 1 )
      end

      it "redirects to the new course" do
        post :create, course: FactoryGirl.attributes_for( :course )
        expect( response ).to redirect_to( course_path( assigns( :course ) ) )
      end
    end

    context "with invalid attributes" do
      it "does not save the new course" do
        expect {
          post :create, course: FactoryGirl.attributes_for( :course, name: nil )
        }.to_not change( Course, :count )
      end

      it "re-renders the new course" do
        post :create, course: FactoryGirl.attributes_for( :course, name: nil )
        expect( response ).to render_template( :new )
      end
    end
  end

  describe 'PATCH #update' do
    let(:course) { FactoryGirl::create(:course) }

    context "valid attributes" do
      it "located the requested @course" do
        patch :update, id: course, course: FactoryGirl.attributes_for( :course, name: "i change this!" )
        expect( assigns( :course ) ).to eq( course )
      end

      it "changes @course's attributes" do
        patch :update, id: course, course: FactoryGirl.attributes_for( :course, name: "i change this!" )
        course.reload
        expect( course.name ).to eq( "i change this!" )
      end

      it "redirects to the updated course" do
        patch :update, id: course, course: FactoryGirl.attributes_for( :course, name: "i change this!" )
        expect( response ).to redirect_to( course_path( assigns( :course ) ) )
      end
    end

    context "invalid attributes" do
      it "does not change the course's attributes" do
        patch :update, id: course, course: FactoryGirl.attributes_for( :course, name: nil )
        old_name = course.name
        course.reload
        expect( course.name ).to eq( old_name )
      end

      it "re-renders the edit template" do
        patch :update, id: course, course: FactoryGirl.attributes_for( :course, name: nil )
        expect( response ).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:course) { FactoryGirl::create(:course) }

    it "deletes the course" do
      course
      expect{
        delete :destroy, id: course
      }.to change( Course, :count ).by( -1 )
    end

    it "redirects to courses#index" do
      delete :destroy, id: course
      expect( response ).to redirect_to courses_url
    end
  end
end
