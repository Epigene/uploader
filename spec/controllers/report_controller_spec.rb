# spring rspec spec/controllers/report_controller_spec.rb
RSpec.describe ReportController, type: :controller do
  before :each do
    @user = logged_in_user
  end

  describe "GET :new" do
    context "when working as intended" do
      it "does not produce errors" do
        expect{get :new}.to_not raise_error
      end
    end
  end

  describe "GET :show" do
    context "when format or commit params request a pdf" do
      let(:params) { {report_start_date: "2017-01-01", report_end_date: "2017-01-01", output_format: "Download PDF Report"} }

      it "serves a pdf" do
        allow(subject).to receive(:send_file).and_return(nil)
        expect(subject).to receive(:send_file).once
        get :show, params: params
      end
    end

    context "when format or commit params request a html" do
      let(:params) { {report_start_date: "2017-01-01", report_end_date: "2017-01-01", output_format: "See HTML Report"} }

      it "renders a template" do
        allow(subject).to receive(:render).and_return(nil)
        expect(subject).to receive(:render).with(
          "report/show",
          locals: anything
        ).once.and_return(nil)

        get :show, params: params
      end
    end
  end

end
