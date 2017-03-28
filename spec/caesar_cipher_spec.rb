# caesar_chiper_spec.rb
#
require 'caesar_cipher'
require 'byebug'

describe CaesarCipher do

  describe "attributes" do

    subject { CaesarCipher.new(:phrase => "abcd", :key => 4) }

    it { is_expected.to respond_to(:phrase) }
    it { is_expected.to respond_to(:key) }
    it { is_expected.to respond_to(:secret_key) }

    it "does not set :secret_key" do
     expect { subject.secret_key = "something" }.to raise_error(NoMethodError)
    end
  end


  describe "Encode a phrase" do

    context "given an empty string" do

      subject { CaesarCipher.new(:phrase => "", :key => 4) }

      it "secret_key an empty string" do
        expect(subject.secret_key).to eql("")
      end
    end

    context "given a key less than 1" do

      subject { CaesarCipher.new(:phrase => "original", :key => 0) }

      it "it does not create a cipher" do
        expect(subject.secret_key).to eql("original")
      end
    end

    context "given a string of lowercase letters and a key less than 26" do

      subject { CaesarCipher.new(:phrase => "abcd", :key => 3) }

      it "the secret key for 'abcd' with a key of 3 is 'defg'" do
        expect(subject.secret_key).to eql("defg")
      end
   end

   context "given a string of uppercase letters and a key less than 26" do

      subject { CaesarCipher.new(:phrase => "ABCD", :key => 3) }

      it "the secret key for 'ABCD' with a key of 3 is 'DEFG'" do
        expect(subject.secret_key).to eql("DEFG")
      end
   end

   context "given a string of lowercase letters and a key of 25" do

     subject { CaesarCipher.new(:phrase => "abcd", :key => 25) }

     it "the secret key for 'abcd' with a key of 25 is 'zabc'" do
       expect(subject.secret_key).to eql("zabc")
     end
   end

   context "given a string of uppercase letters and a key of 25" do

     subject { CaesarCipher.new(:phrase => "ABCD", :key => 25) }

     it "the secret key for 'ABCD' with a key of 25 is 'ZABC'" do
       expect(subject.secret_key).to eql("ZABC")
     end
   end

   context "given a string of lowercase letters and a key of 26" do

     subject { CaesarCipher.new(:phrase => "abcd", :key => 26) }

     it "the secret key for 'abcd' with a key of 26 is 'abcd'" do
       expect(subject.secret_key).to eql("abcd")
     end
   end

   context "given a string of uppercase letters and a key of 26" do

     subject { CaesarCipher.new(:phrase => "ABCD", :key => 26) }

     it "the secret key for 'ABCD' with a key of 26 is 'ABCD'" do
       expect(subject.secret_key).to eql("ABCD")
     end
   end

   context "given a string of letters with a non-alpha character" do

     subject { CaesarCipher.new(:phrase => "ABC!", :key => 3) }

     it "the secret key for 'ABC!' with a key of 3 is 'DEF!'" do
       expect(subject.secret_key).to eql("DEF!")
     end
   end


  end
end
