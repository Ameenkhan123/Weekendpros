class HomeController < ApplicationController
  layout 'weekendpro'
  def index
   @q = Skill.ransack(params[:q])
   @skills = @q.result(distinct: true)
 end
end
