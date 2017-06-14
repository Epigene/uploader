# spring rspec spec/controllers/login_controller_spec.rb
RSpec.describe LoginController, type: :controller do

  describe "DELETE :destroy" do
    context "when there is a user in session" do
      let(:user) { create(:user) }

      before do
        session[:user_id] = user.id
      end

      it "removes user from session and redirects to login form with flash" do
        expect{ delete :destroy }.to change{ session[:user_id] }.to(nil)

        expect(response).to redirect_to("/login/new")
        expect(flash[:notice]).to be_present
      end
    end
  end

end
