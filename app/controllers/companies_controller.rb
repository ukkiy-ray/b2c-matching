class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    if user_signed_in?
      @user_relations = UserRelation.find_by(user_id: current_user.id, company_id: @company.id)
      @company_relations = CompanyRelation.find_by(user_id: current_user.id, company_id: @company.id)
    end

    @user_relation = UserRelation.new
  end
end
