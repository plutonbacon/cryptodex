require 'spec_helper'

describe Cryptodex::XTEA do
  let(:key) { String.new("blehbhelbhelbhel") }
  let(:message) { String.new("thisisavery large string that i am going to encrypt") }

  it 'enciphers the message using the given key' do
    expect(Cryptodex::XTEA.encipher(message, key)).to eq("blah")
  end
end
