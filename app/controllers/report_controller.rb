class ReportController < ApplicationController

  def index
    @reports = Report.where(nil)
    @reports = @reports.from_age(params[:age_from]) if params[:age_from].present?
    @reports = @reports.age_to(params[:age_to]) if params[:age_to].present?
    @reports = @reports.date_from(params[:date_from]) if params[:date_from].present?
    @reports = @reports.date_to(params[:date_to]) if params[:date_to].present?
    @reports = @reports.gender(params[:gender]) if params[:gender].present?
  end

  def create
    report = Report.new(report_params)

    if report.save
      rep = json_template(report)
      render json: rep, status: 201
    else
      render json: report.errors, status: 422
    end
  end

  private

  def report_params
    params.permit(:date, :name, :gender, :age, :city, :state, :county, :latitude, :longitude)
  end

  def json_template(report)
    rep = {}
    rep[:date]=report.date; rep[:name]=report.name; rep[:gender]=report.gender; rep[:age]=report.age; rep[:city]=report.city; 
      rep[:state]=report.state; rep[:county]=report.county; rep[:latitude]=report.latitude; rep[:longitude]=report.longitude
    return rep
  end
end
