class ApplicationController < ActionController::Base
  include Authentication

  allow_browser versions: :modern
  skip_before_action :verify_authenticity_token unless Rails.env.production?

  before_action :set_current_user

  private

  def set_current_user
    Current.user = Current.session&.user
  end
end
