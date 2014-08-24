require 'spec_helper'

describe 'Sprockets integration' do
  let(:assets) { Sprockets::Environment.new }

  before do
    assets.append_path(Pathname(__FILE__).dirname.join('../dummy/app/assets/stylesheets'))

    RailsMqpacker.install(assets)
  end

  subject { assets['test.css'].to_s }

  it 'packs similar media queries' do
    expect(subject).to eq <<-END
a {
  color: blue;
}

i {
  font-size: 1em;
}

@media screen and (max-width: 980px) {
  a {
    color: red;
  }

  i {
    font-size: 2em;
  }
}
END
  end
end
