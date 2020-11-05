class CompanyRelationsController < ApplicationController
  attr_accessor :user_id, :company_id

  def create
    @user = User.find(params[:user_id])
    @company_relation = CompanyRelation.new(company_id: current_company.id, user_id: @user.id)
    @company_relation.save
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:user_id])
    @company_relation = CompanyRelation.find_by(company_id: current_company.id, user_id: @user.id)
    @company_relation.destroy
    redirect_to user_path(@user.id)
  end
end
