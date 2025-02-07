# Paradigm CTF 2023 - Black Sheep - Solution

<!-- MarkdownTOC levels="1,2,3" autolink="true" -->

- [Introduction](#introduction)
- [The Contract](#the-contract)
- [Contract Analysis](#contract-analysis)
  - [1. The `withdraw` Function](#1-the-withdraw-function)
  - [2. Identifying the Vulnerability](#2-identifying-the-vulnerability)
- [Exploit Construction](#exploit-construction)
- [Generating a Valid Signature](#generating-a-valid-signature)
- [Exploit Code](#exploit-code)
- [Conclusion](#conclusion)
- [Repositories](#repositories)

<!-- /MarkdownTOC -->

## Introduction

In this article we'll discuss the solution to the challenge from the Paradigm CTF 2023 called "Black Sheep." The contract is written in Huff, a low-level language designed for Ethereum Virtual Machine (EVM) development. As someone passionate about low-level EVM security research, this was an exciting opportunity to dive deep into Huff.

## The Contract

```huff
/* Interface */
#define function withdraw(bytes32,uint8,bytes32,bytes32) payable returns ()


#define macro CHECKVALUE() = takes (0) returns (0) {
    callvalue 0x10 gt over jumpi
    0x00 dup1 revert
    over:
        0x00
        0x00
        0x00
        0x00
        callvalue 0x02 mul
        caller
        0xFFFFFFFF
        call
}
#define macro CHECKSIG() = takes (0) returns (1) {
    0x04 calldataload
    0x00 mstore
    0x24 calldataload
    0x20 mstore
    0x44 calldataload
    0x40 mstore
    0x64 calldataload
    0x60 mstore
    0x20
    0x80
    0x80
    0x00
    0x1
    0xFFFFFFFF
    staticcall
    iszero invalidSigner jumpi
    0x80 mload
    0xd8dA6Bf26964AF9D7eed9e03e53415D37AA96044 eq correctSigner jumpi
    end jump

    correctSigner:
        0x00
        end jump
    invalidSigner:
        0x01
        end jump
    end:
}
#define macro WITHDRAW() = takes (0) returns (0){
    CHECKVALUE()
    CHECKSIG()
    iszero iszero noauth jumpi
    0x00 dup1 dup1 dup1
    selfbalance caller
    gas call
    end jump
    noauth:
        0x00 dup1 revert
    end:
}


#define macro MAIN() = takes (0) returns (0) {
    // Identify which function is being called.
    0x00 calldataload 0xE0 shr
    dup1 __FUNC_SIG(withdraw) eq withdrawj jumpi
    callvalue 0x00 lt recieve jumpi

    0x00 0x00 revert

    withdrawj:
        WITHDRAW()
    recieve:
}
```

## Contract Analysis

### 1. The `withdraw` Function

The function `withdraw(bytes32,uint8,bytes32,bytes32)` maps to the `WITHDRAW()` macro. It relies on two sub-macros:

- **`CHECKVALUE()`**: Verifies `msg.value` and reverts if it's more than `0x10` wei. If valid, it doubles the amount and sends it back.
- **`CHECKSIG()`**: Calls the precompiled contract `ecrecover` (at address `0x1`) to verify the signature against a specific address.

### 2. Identifying the Vulnerability

- **Signature Validation Issue:** The contract allows any valid signature, even from addresses other than the intended signer (`0xd8dA6Bf26964AF9D7eed9e03e53415D37AA96044`).
- **Redundant `ISZERO` Usage:** The use of `ISZERO` twice doesn't add value; it leaves the stack unchanged. This quirk is not critical for the exploit and may be distractive.
- **Fallback Stack Behavior:** In this particular case, the returned value from
  `CHECKVALUE()`'s `CALL` is used by `JUMPI` if `CHECKSIG()` doesn't push a value.
  This behavior influences the control flow, as `JUMPI` will rely on whatever
  happens to be on top of the stack.

## Exploit Construction

1. Deploy an Attack Contract:

  - The `receive()` function should revert when `msg.value == 0x12` to ensure `CALL` returns `0x0`.
  - Otherwise, it should succeed to collect the funds.

2. Trigger the Vulnerability:

  - Call `withdraw()` with either:
    - A valid signature from any address.
    - Or the tuple `(0x00, 27, 0x00, 0x00)` which results in a non-zero response from `ecrecover`.

## Generating a Valid Signature

We can use `cast` to create an address and generate a valid signature.

<p style="text-align: center;">
  <img width="600" src="/docs/assets/img/black-sheep-01.png">
</p>

## Exploit Code

```solidity
function testExploit() public {
    bytes32 msgHash = keccak256("Black Sheep");
    bytes32 r = 0x9f2c9ed6b027b594f5072cc39b6c5ffca1ca157ad5b661d0d268c577eede360c;
    bytes32 s = 0x52e8bf726d82a28ebd9b172efba7e75fd0671f6c1544b5a5b70ad803de360e33;
    uint8 v = 27;
    bank.withdraw{value: 0x09}(msgHash, v, r, s);

    assertEq(address(Challenge(challengeAddress).BANK()).balance, 0);
}

receive() external payable {
  if (msg.value == 0x12) {
    revert("");
  }
}
```

## Conclusion

This challenge highlighted the nuances of stack manipulation in Huff and the
critical importance of careful flow control, especially for security-related
validations. It also underscores the need for robust signature verification.

To prevent vulnerabilities like signature malleability, contracts should
implement additional controls. For example, the tuple `(0x00, 27, 0x00, 0x00)`
is considered valid by `ecrecover`, so contracts relying on signature
validation must properly handle such cases to prevent misuse.

Additionally, signatures should be bound to specific messages to prevent
replay attacks. Validation checks must ensure only authorized signers are
accepted to maintain the contract's security posture.

Incorporating these best practices helps build more secure smart contracts
and reduces the risk of common attack vectors.

## Repositories

* https://github.com/bentobox19/paradigm-ctf/
* https://github.com/paradigmxyz/paradigm-ctf-2023
