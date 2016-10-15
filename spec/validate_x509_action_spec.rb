describe Fastlane::Actions::ValidateX509Action do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The validate_x509 plugin is working!")

      Fastlane::Actions::ValidateX509Action.run(nil)
    end
  end
end
