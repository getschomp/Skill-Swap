class Location < ActiveRecord::Base
    has_many :users

    geocoded_by :address
    
    def address
      [:zipcode].compact.join(', ')
    end
end
