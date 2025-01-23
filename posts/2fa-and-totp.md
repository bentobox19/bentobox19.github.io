# Let's Talk About 2FA and TOTP

## Overview

2FA stands for **"Two-Factor Authentication"**, meaning you use two methods to verify your identity for a service. For example, a password is **"something you know,"** while your cellphone is **"something you have."** There is also **"something you are"** (biometrics).

Some argue that **"somewhere you are"** (location-based authentication) is another factor, but implementation is more complex. For simplicity, let's focus on **"something you know, have, or are."**

TOTP stands for **"Time-Based One-Time Password Algorithm"**, derived from HOTP. Both are defined in **[RFC 6238](https://datatracker.ietf.org/doc/html/rfc6238)** and **[RFC 4226](https://datatracker.ietf.org/doc/html/rfc4226)**.

## How Does It Work?

The service generates a **secret** and shares it with you, usually as a QR code, creating a **shared secret** between you and the service. To authenticate, you must prove that you _have_ this secret.

To protect it from prying eyes, both you and the service follow these steps independently:

1. Combine the shared secret with the current timestamp.
2. Generate a hash.
3. Truncate the hash to `N` digits.
4. Send the digits, and the service compares them with its own calculation.

![2fa-and-top-01.jpeg](/bentobox19/assets/2fa-and-top-01.jpeg)

To summarize:

1. Retrieve the secret and timestamp.
2. Hash them together.
3. Truncate.
4. Send and compare.

... Profit! 🚀

## Breaking It Down

TOTP as an authentication factor (**"something you have"**—the shared secret on your device) combined with your password (**"something you know"**) significantly enhances security. So far, so good, right?

Let's break this system into three key parts:

1. **Storage of the shared secret by the service**
2. **Transmission of the shared secret to the user**
3. **Storage of the secret on the user's device**

To verify your identity, both you and the service must perform a computation each time a challenge is issued. This means the service must store your secret, typically in plaintext, within a database—requiring strong security controls.

In other words, your service stores this secret in a database, just like it does with your password. 🤔

![2fa-and-top-02.jpeg](/bentobox19/assets/2fa-and-top-02.jpeg)

### Security Considerations

The secret is typically transmitted to the user in plaintext or as a QR code—both of which ultimately expose the secret in plaintext. In most cases, protecting the data in transit with **HTTPS** is sufficient.

Once the secret is stored on your device, it should be handled like any sensitive key. Best practices include:

- **Using encrypted storage** to protect the secret.
- **Keeping a secure backup** to prevent loss.
- **Avoiding uncontrolled cloud copies** to minimize exposure risks.

## Wrapping It Up

Using multiple authentication factors is always better than relying on just one! However, it's essential to be aware of alternative authentication methods. Explore ways to authenticate that don't rely on centralized sources. 😉
