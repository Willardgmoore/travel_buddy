class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about_us]
  before_action :user, only: [:home, :account]

  def home
    @trips = Trip.where(user_id:@user)
    Reservation.where(user_id:8).order(:check_in_date).limit(5)
    @checklists = Checklist.where(user_id:current_user).order(:due_date).limit(5)
  end

  def account
    
  end

  def about_us
  end

  private

  def user
    @user = current_user
  end

end
