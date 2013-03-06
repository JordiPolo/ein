require 'spec_helper'

module Ein
  describe Console do
    it "prints when the message priority is bigger than the default priority" do
      console = Console.new(:debug)
      Kernel.should_receive(:puts).with("trusmis")
      console.info("trusmis")
    end
    it "prints the message when priority is equal to the default priority" do
      console = Console.new(:debug)
      Kernel.should_receive(:puts).with("trusmis")
      console.debug("trusmis")
    end
    it "does not print when the priority is less than the default priority" do
      console = Console.new(:info)
      Kernel.should_not_receive(:puts).with("trusmis")
      console.debug("trusmis")
    end
    it "prints nothing if we chose a quite level" do
      console = Console.new(:quiet)
      Kernel.should_not_receive(:puts).with("trusmis")
      console.debug("trusmis")
      console.info("trusmis")
    end
  end
end
