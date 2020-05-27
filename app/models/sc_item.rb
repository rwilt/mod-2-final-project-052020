class ScItem < ApplicationRecord
    belongs_to :sellers_cart
    belongs_to :item

    def self.also_liked
      self.all.collect do |i|
            i.item.name
            i.item.id
        end 
        #.sample(3).join(", ") 
        #right now this returns names, but i want to also be able to link 
        #to those pages. 
    end
end
