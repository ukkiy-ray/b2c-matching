class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if company_signed_in?
      @company_relations = CompanyRelation.find_by(company_id: current_company.id, user_id: @user.id)
      @user_relations = UserRelation.find_by(company_id: current_company.id, user_id: @user.id)

      rooms = current_company.rooms
      #自分が入ってるroomの相手のidを格納する
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end

    end

    @company_relation = CompanyRelation.new
  end
end
