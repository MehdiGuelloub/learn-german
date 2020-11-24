class ApplicationController < ActionController::Base
  def per_page
    per = Integer(params[:per]) rescue 100
    [per, 250].min
  end
end
