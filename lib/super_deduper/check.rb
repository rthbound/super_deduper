require "pay_dirt"
module SuperDeduper
  class Check < PayDirt::Base
    def initialize(options)
      options = {
        delimiter: " "
      }.merge(options) and load_options(:enum, :class, :column, options)
    end

    def execute!
      @enum.each do |term|
        @ret ||= {}
        @ret.merge!({ term => {} }) # Top level hash keys

        term.split(@delimiter).each do |token|
          @ret[term][token] = @class.where(["#{@column} ilike ?", "%#{token}%"])
        end
      end

      if dupe_me_not
        return PayDirt::Result.new(success: true, data: "No matches found")
      else
        return PayDirt::Result.new(success: true, data: ret)
      end
    end

    def dupe_me_not
      !@ret.any? { |k,v| v.any? { |kay,vee| vee != [] } }
    end
  end
end
