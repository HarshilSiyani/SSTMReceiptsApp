class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @receipts = Receipt.where("owner_id = #{current_user.id}")
  end
end
