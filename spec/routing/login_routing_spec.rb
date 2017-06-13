# spring rspec spec/routing/login_routing_spec.rb
RSpec.describe "Login routes", type: :routing do

  describe "/login/*" do
    it "should route GET '/login/new' to Login#new" do
      expect(get: "/login/new").to route_to(
        controller: "login",
        action: "new",
      )
    end

    it "should route POST '/login' to Login#create" do
      expect(post: "/login").to route_to(
        controller: "login",
        action: "create",
      )
    end
    
    it "should route DESTROY '/login' to Login#destroy" do
      expect(destroy: "/login").to route_to(
        controller: "login",
        action: "destroy",
      )
    end
  end

end
