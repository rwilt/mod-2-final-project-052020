class Purchase < ApplicationRecord
    belongs_to :item
    belongs_to :buyer

    def uniq_item
        hash = {}
        self.items.each do |item|
            if hash[item] == nil
                hash[item] = 1
            else
                hash[item] += 1
            end
        end
        hash
    end
    
end
