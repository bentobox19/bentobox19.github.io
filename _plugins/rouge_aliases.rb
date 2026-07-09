# Register lexer aliases for languages Rouge lacks a dedicated lexer for.
# Huff (EVM assembly-like) and Solidity fall back to close relatives so that
# ```huff and ```solidity fences still receive syntax coloring instead of
# rendering as an unstyled block.
require "rouge"

module Rouge
  module Lexers
    # Huff -> NASM assembly highlighting (opcodes, hex literals, comments).
    class Huff < Nasm
      title "Huff"
      desc "Huff (aliased to NASM assembly highlighting)"
      tag "huff"
    end unless defined?(Huff)

    # Solidity -> JavaScript highlighting (keywords, strings, numbers, comments).
    class Solidity < Javascript
      title "Solidity"
      desc "Solidity (aliased to JavaScript highlighting)"
      tag "solidity"
      filenames "*.sol"
    end unless defined?(Solidity)
  end
end
