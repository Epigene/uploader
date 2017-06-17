# spring rspec spec/routing/report_routing_spec.rb
RSpec.describe "Report routes", type: :routing do

  it "routes GET '/report/new' to Report#new" do
    expect(get: "/report/new").to route_to(
      controller: "report",
      action: "new",
    )
  end

  it "routes GET '/report' to Report#show" do
    expect(get: "/report").to route_to(
      controller: "report",
      action: "show",
    )
  end

end
