class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
    if user_signed_in?
      @user_relations = UserRelation.find_by(user_id: current_user.id, company_id: @company.id)
      @company_relations = CompanyRelation.find_by(user_id: current_user.id, company_id: @company.id)

      rooms = current_user.rooms
      #自分が入ってるroomの相手のidを格納する
      @company_ids = []
      rooms.each do |r|
        @company_ids << r.company_id
      end
    end

    @user_relation = UserRelation.new
  end
end
