class ApplicationController < ActionController::Base
  protect_from_forgery

  def gestor_usr_required
    true
  end
end
