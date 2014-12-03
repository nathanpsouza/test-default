require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do

  describe "#GET index" do
    let( :students ) { FactoryGirl::create_list( :student, 2 ) }

    it "populates an array of students" do
      get :index
      expect( assigns( :students ) ).to match_array( students )
    end

    it "renders the :index template" do
      get :index
      expect( response ).to render_template( :index )
    end
  end

  describe "#GET show" do
    let( :student ) { FactoryGirl::create( :student ) }

    it "assigns the requested student to @student" do
      get :show, id: student
      expect( assigns(:student) ).to eq( student )
    end

    it "renders the :show template" do
      get :show, id: student
      expect( response ).to render_template( :show )
    end
  end

  describe "#GET new" do
    it "assigns a new Student to @student" do
      get :new
      expect( assigns( :student ) ).to be_a_new( Student )
    end

    it "renders the :new template" do
      get :new
      expect( response ).to render_template( :new )
    end
  end

  describe 'GET #edit' do
    let( :student ) { FactoryGirl::create( :student ) }

    it "assigns the requested student to @student" do
      get :edit, id: student
      expect( assigns( :student ) ).to eq( student )
    end

    it "renders the :edit template" do
      get :edit, id: student
      expect( response ).to render_template( :edit )
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new student" do
        expect {
          post :create, student: FactoryGirl.attributes_for( :student )
        }.to change( Student, :count ).by( 1 )
      end

      it "redirects to the new student" do
        post :create, student: FactoryGirl.attributes_for( :student )
        expect( response ).to redirect_to( student_path( assigns( :student ) ) )
      end
    end

    context "with invalid attributes" do
      it "does not save the new student" do
        expect {
          post :create, student: FactoryGirl.attributes_for( :student, name: nil )
        }.to_not change( Student, :count )
      end

      it "re-renders the new student" do
        post :create, student: FactoryGirl.attributes_for( :student, name: nil )
        expect( response ).to render_template( :new )
      end
    end
  end

  describe 'PATCH #update' do
    let(:student) { FactoryGirl::create(:student) }

    context "valid attributes" do
      it "located the requested @student" do
        patch :update, id: student
        expect( assigns( :student ) ).to eq( student )
      end

      it "changes @student's attributes" do
        patch :update, id: student, student: FactoryGirl.attributes_for( :student, name: "i change this!" )
        student.reload
        expect( student.name ).to eq( "i change this!" )
      end

      it "redirects to the updated student" do
        patch :update, id: student, student: FactoryGirl.attributes_for( :student, name: "i change this!" )
        expect( response ).to redirect_to( student_path( assigns( :student ) ) )
      end
    end

    context "invalid attributes" do
      it "does not change the student's attributes" do
        patch :update, id: student, student: FactoryGirl.attributes_for( :student, name: nil )
        old_name = student.name
        student.reload
        expect( student.name ).to eq( old_name )
      end

      it "re-renders the edit template" do
        patch :update, id: student, student: FactoryGirl.attributes_for( :student, name: nil )
        expect( response ).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:student) { FactoryGirl::create(:student) }

    it "deletes the student" do
      expect{
        delete :destroy, id: student
      }.to change( Student,:count ).by( -1 )
    end

    it "redirects to students#index" do
      delete :destroy, id: student
      expect( response ).to redirect_to students_url
    end
  end
end
