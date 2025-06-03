class CrimeMapConfigsController < ApplicationController
  def index
   @crime_map_configs = CrimeMapConfig.all
  end
end
