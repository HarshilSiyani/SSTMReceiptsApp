class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @receipts = Receipt.where("owner_id = #{current_user.id}")
    @user_departments = Department.where("head_id = '#{current_user.id}'")
    @receipts_pending = Receipt.where("owner_id = #{current_user.id} AND status = 'pending'")
  end
end
