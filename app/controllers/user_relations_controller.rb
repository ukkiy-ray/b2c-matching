class UserRelationsController < ApplicationController
  attr_accessor :user_id, :company_id

  def create
    @company = Company.find(params[:company_id])
    @user_relation = UserRelation.new(user_id: current_user.id, company_id: @company.id)
    @user_relation.save
    redirect_to company_path(@company.id)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @user_relation = UserRelation.find_by(user_id: current_user.id, company_id: @company.id)
    @user_relation.destroy
    redirect_to company_path(@company.id)
  end

end
