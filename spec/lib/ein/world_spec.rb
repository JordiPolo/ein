#encoding: utf-8
require 'spec_helper'

module Ein
  describe World do
    subject { World.new}

    context "render" do
      it "must render boundaries" do
         expect(subject.render).to include("boundaries")
      end
      it "must render obstacles" do
         expect(subject.render).to include("obstacles")
      end
    end

  end
end
