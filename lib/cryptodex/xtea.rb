# Copyright (c) 2016, Pluto and Bacon <plutonbacon@dynosoft.org>
#
# Permission to use, copy, modify, and/or distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright notice
# and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
# OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
# THIS SOFTWARE.

require 'cryptodex/util'

module Cryptodex
  # XTEA (eXtended TEA) is a block cipher designed by David Wheeler and 
  # Roger Needham to correct weaknesses in TEA. 
  module XTEA

    DELTA = 0x9e3779b9
    MASK = 0xFFFFFFFF
    NUM_ROUNDS = 32

    # Encipher a string using a key.
    #
    # @param num_rounds [Integer]
    # @param v [String] the string to encipher
    # @param k [String] the key
    #
    # @return [String] the ciphertext
    def self.encipher(num_rounds=NUM_ROUNDS, message, k)
      v = Util.str_to_bin(message)
      key = Util.str_to_bin(key)

      v0, v1 = v[0], v[1]
      sum = 0

      (1..num_rounds).each do |i|
        v0 += (((v1 << 4) ^ (v1 >> 5) + v1) ^ (sum + key[sum & 3])) & MASK
        sum += DELTA;
        v1 += (((v0 << 4) ^ (v0 >> 5) + v0) ^ (sum + key[(sum >> 11) & 3])) & MASK 
      end

      return Util.fixnums_to_s([v0, v1])
    end # def encipher

    # Decipher a string using a key.
    #
    # @param num_rounds [Integer]
    # @param v [String] the string to decipher
    # @param key [String] the key
    #
    # @return [String] the plaintext
    def self.decipher(num_rounds=NUM_ROUNDS, v, key)
      v0, v1 = v[0], v[1]
      sum = DELTA * num_rounds

      (1..num_rounds).each do |i|
        v1 -= (((v0 << 4) ^ (v0 >> 5) + v0) ^ (sum + key[(sum >> 11) & 3])) & MASK
        sum -= DELTA
        v0 -= (((v1 << 4) ^ (v1 >> 5) + v1) ^ (sum + key[sum & 3])) & MASK
      end

      return [v0, v1]
    end # def decipher
  end # module XTEA
end # module Cryptodex
