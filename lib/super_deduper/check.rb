module SuperDeduper
  class Check < PayDirt::Base
    def initialize(options)
      load_options(:enum, :klass, :kolumn, options)
    end

    def execute!
      ret_hash = {}

      @enum.each do |term|
        ret_hash.merge!({
          "#{term}" => {}
        })

        term.split(" ").each do |token|
          ret_hash[term][token] = @klass.where(["? ilike ?", @kolumn, token])
        end
      end

      if dupe_me_not(ret_hash)
        return PayDirt::Result.new(success: true, data: "No matches found")
      else
        return PayDirt::Result.new(success: true, data: ret_hash)
      end
    end

    def dupe_me_not(ret_hash)
      !ret_hash.any? { |k,v| v.any? { |kay,vee| vee != [] } }
    end
  end
end
