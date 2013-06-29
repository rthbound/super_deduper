require 'test_helper'

require_relative "../../../lib/super_deduper/check"

describe SuperDeduper::Check do
  before do
    @breakfast = MiniTest::Mock.new
    @subject   = SuperDeduper::Check
    @options   = {
      enum: ["Bacon Eggs", "Sausage Biscuit"],
      class: @breakfast,
      column: "main_ingredient"
    }
  end

  it "initializes" do
    res = @subject.new(@options)
    res.must_be_instance_of @subject
    res.must_respond_to :execute!
  end

  it "initializes" do
    @options[:enum].map { |x| x.split(" ") }.flatten.each do |term|
      @breakfast.expect(:where, MiniTest::Mock.new.expect(:!=, false, [[]]), [["main_ingredient ilike ?", "%#{term}%"]])
    end

    res = @subject.new(@options).execute!
    res.successful?.must_equal true
  end
end
