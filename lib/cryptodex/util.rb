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
  module Util

    # Convert an array of Fixnums to a string.
    #
    # @param f [Array] an array of Fixnums
    #
    # @return [String]
    def self.fixnums_to_s(f)
      f.pack("V*").chars.join("")
    end # def fixnums_to_s

    def self.convert_to_int32(v)
      # Pad with 0 (null) as necessary
      if !v.length == 4
        v << '0' * (4 - v.length)
      end
      v.unpack('V*')[0]
    end # def convert_to_int32

    # Return the binary representation of a 4-character string.
    def self.str_to_bin(v)
      s = []

      v.scan(/.{1,4}/).each do |a|
        unless a.nil? or a == ""
          # Pad the block length if it is insufficient
          if a.length != 4
            a << 0 * (4 - a.length)
          end
          s.push(convert_to_int32(a))
        end
      end
      s.compact
    end # def str_to_bin
  end # module Util
end # module Cryptodex
