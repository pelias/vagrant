require 'spec_helper'

describe 'pelias::user' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  before do
    stub_command('pgrep -f elasticsearch').and_return(true)
  end

  it 'should create the pelias user' do
    expect(chef_run).to create_user_account('pelias').with(
      manage_home:  true,
      create_group: true,
      ssh_keygen:   false,
      home:         '/home/pelias'
    )
  end
end
