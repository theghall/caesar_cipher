# caesar_chiper_spec.rb
#
require 'caesar_cipher'

describe CaesarCipher do

  describe "attributes" do

    subject { CaesarCipher.new(:phrase => "abcd", :key => 4) }

    it { is_expected.to respond_to(:phrase) }
    it { is_expected.to respond_to(:key) }
  end

  describe ".encode" do

    context "given an empty string" do

      subject { CaesarCipher.new(:phrase => "", :key => 4) }

      it "returns an empty string" do
        expect(subject.encode).to eql("")
      end
    end

    context "given a key less than 1" do

      subject { CaesarCipher.new(:phrase => "original", :key => 0) }

      it "does not encode the string" do
        expect(subject.encode).to eql("original")
      end
    end

  end
end
