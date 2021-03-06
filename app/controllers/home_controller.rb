class HomeController < ApplicationController
	before_filter :authenticate_user!, :only => 'admin'
  def index
  end

  def home
  end

  # def companyhistory
  #   ### Static Page ###
  # end

  # def outreach
  #   ### Static Page ###
  # end

  # def installers
  #   ### Static Page ###
  # end

  # def floorcovering
  #   ### Static Page ###
  # end

  # def structural
  #   ### Static Page ###
  # end

  # def gallery
  # end

  # def interior
  #   ### Static Page ###
  # end

  def admin
  end

  def gallery
    [['floor_covering', 1], ['interior', 2], ['structural', 3]].each do |type|
      instance_variable_set("@#{type[0]}_type", "#{type[0].capitalize}")
      instance_variable_set("@#{type[0]}_projects", Project.where(:product_type => type[1]))
      instance_variable_set("@#{type[0]}_images", instance_variable_get("@#{type[0]}_projects").map {|i| [i.slug, i.images]})
    end
  end

  def addgallery
    @project = Project.new
    2.times {@project.images.build}
  end
end
