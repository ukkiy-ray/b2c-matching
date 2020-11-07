class TopController < ApplicationController


  def index
    if user_signed_in?
      @companies = Company.all

      

    elsif company_signed_in?
      @users = User.all

      

    end
  end

end
