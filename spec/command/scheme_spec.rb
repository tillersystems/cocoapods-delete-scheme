require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Scheme do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ scheme }).should.be.instance_of Command::Scheme
      end
    end
  end
end

