class CrimePostcodeExclusionsController < ApplicationController
  def index
     @crime_postcode_exclusions = CrimePostcodeExclusion.all
  end
end
