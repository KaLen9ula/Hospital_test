class CategoriesController < ApplicationController
  def create
    category_id = params[:id]
    if category_id != ''
      doctors = Doctor.left_joins(:categories).where(doctors: { category_id: category_id })
      @doctors_by_category = User.joins(:doctor).where(users: { doctors: doctors })
      respond_to do |format|
        format.js { render partial: 'layouts/doc' }
      end
    end
  end
end
