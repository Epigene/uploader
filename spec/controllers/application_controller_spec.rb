# spring rspec spec/controllers/application_controller_spec.rb
RSpec.describe ApplicationController, type: :controller do

  describe "#current_user" do
    context "when there is a user in session" do
      let(:user) { create(:user) }

      before :each do
        session[:user_id] = user.id
      end

      it "returns the user record" do
        expect(subject.send(:current_user)).to eq user
      end
    end

    context "when there is no user in session" do
      it "returns nil" do
        expect(subject.send(:current_user)).to eq nil
      end
    end

  end

end
