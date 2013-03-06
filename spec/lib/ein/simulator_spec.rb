#encoding: utf-8
require 'spec_helper'

module Ein
  describe Simulator do

    context "new simulator with no params" do 
      subject {Simulator.new}
      it { should_not be_running }
      its(:world) {should be}
    end

    context "it can run simulations" do
      subject(:simulator) {Simulator.new(Console.new(:quiet)) }

      it "can be started and stopped" do
        simulator.start
        expect(simulator).to be_running
        simulator.stop
        expect(simulator).not_to be_running
      end

    end

  end
end
