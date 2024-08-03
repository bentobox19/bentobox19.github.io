# Elastic Security AVS - Early View of Components and Economics

2024 Aug 02

## 1. Introduction

In a rapidly evolving blockchain landscape, malicious actors present across the entire cyber kill chain create a demand for specialized security. These vendors must continuously evolve, be highly available, and elastic to meet various sizing requirements and challenges.

To enable consumers to dynamically provision elastic security, **Actively Validated Services (AVS)** through EigenLayer provide a solution. Each AVS maintains essential state information, accomplishing this goal without the need to attract miners or validators. This model builds a trust layer, facilitating the exchange of API-delivered security services with real-time monitoring and rule enforcement, thereby enhancing trust and establishing reputation.

This paper examines the components of an **Elastic Security AVS** and outlines an economic model to support this system. With the adoption of a Web3 approach to the economy of security vendors, the AVS introduces a flexible model adaptable to evolving threats. Additionally, the success of this framework could pave the way for decentralized marketplaces for a wider range of API-based services.

## 2. Components

<p style="text-align: center;">
  <img width="600" alt="Elastic Security AVS" src="/docs/assets/img/elastic-security-avs-components.png">
</p>

### 2.1 Consumers

Consumers in the Elastic Security AVS are users who purchase API calls from providers. They will navigate a Consumer Marketplace-like UX, maintained by the AVS, to find the providers and services they need.

To facilitate transactions, consumers obtain an amount of the AVS **Utility Token**. Consumers send purchase messages to the AVS containing:

- ID of the consumer.
- ID of the provider.
- ID of the service.
- Service fee.

Upon processing, the AVS sends a purchase confirmation including:

- ID of the purchase.
- ID of the consumer.
- ID of the provider.
- ID of the service.
- Funds taken from the consumer’s utility token balance.
- Expiration date for consuming the purchased service.

The customer can make API requests to the provider using a signed token derived from the purchase data for authentication.

The AVS maintains a **Performance Score**:

- The performance score ensures that only high-quality services prevail in the marketplace.
- Each purchase contributes to the provider’s score, with **repeated purchases** significantly influencing the provider's reputation.
- Consumers can publish **negative attestations** for a fee to report failing services. These reviews have an economic cost to the consumer to prevent Sybil attacks.
- A low performance score may impact providers economically, possibly leading to **slashing of staked funds** and expulsion from the marketplace.

<p style="text-align: center;">
  <img width="600" alt="Consumer Interactions" src="/docs/assets/img/elastic-security-avs-consumer-interactions.png">
</p>

A consumer does not necessarily need to be a blockchain wallet or an end-user. For instance, a gateway setup can allow administrators of a blockchain node to select and pay fees for security vendors' services. (See section 2.2 Providers).

Future iterations of the AVS must facilitate the building of “packages,” enabling consumers to become providers within the AVS marketplace.

### 2.2 Providers

Providers are the entities that offer their security services via APIs on the AVS marketplace. While this paper focuses on a decentralized marketplace for security services APIs, **the concept can be extended to any entity exposing a consumable service through an API**.

Providers specialize across various stages of the cyber kill chain and can be categorized into:

- **Proactive Security Measures:** Examples include proactive dApp scanning, event engines, and phishing/social engineering detection.
- **Transaction Security:** Examples include transaction simulation, malicious transaction detection, front-running prevention, and malicious address detection.
- **Incident Response and Recovery:** Examples include asset recovery, victim support and response, and revocation engines.
- **User and Asset Protection:** Examples include Web3 insurance, privacy solutions, and wallet health services.

_It’s worth noting that not all of the service examples named can necessarily be exposed through an API_.

<p style="text-align: center;">
  <img width="600" alt="Provider Interactions" src="/docs/assets/img/elastic-security-avs-provider-interactions.png">
</p>

The provider interacts in several ways:
1. Providers acquire funds in Utility Tokens, which are required by the AVS as a security deposit. This deposit consists of a fixed amount and an additional portion proportional to the volume of transactions.
2. Providers register with the AVS, transferring funds and registering their services.
3. Providers query the AVS for purchases made by consumers.
4. Providers fulfill purchases off-chain.
5. After a certain period, providers can retrieve the fees from their purchases from the AVS.

To participate, **providers must stake a specific amount of AVS tokens**, acting as a guarantee of their service quality and reliability. The stake is proportional to the value of the transactions they handle, becoming an effective security deposit, incentivizing providers to maintain high standards and serving as a security deposit that can be slashed in case of **negative reviews** or **failures in service delivery**. Providers must register with the AVS, staking their tokens and receiving a unique ID. They will also register their services with associated fees, which can be updated, including:

- ID of the provider.
- Text description of the service.
- Number of requests in the package.
- Service fee.
- Expiration range.

Providers will **query the AVS for purchases** made by consumers. The API request from the consumer, **including the purchase ID and a signed token**, serves as proof that the consumer is entitled to the provider’s services, up to the number of requests offered in the purchase.

After a certain period, determined by the performance score and AVS governance variables, **providers can retrieve the fees from their purchases from the AVS**.

As mentioned in section 2.1 Consumers, a consumer does not necessarily need to be a blockchain wallet or an end-user. In other words, the process of signing a request to the provider does not need to be performed by the blockchain client, but can be done by a node gateway.

<p style="text-align: center;">
  <img width="600" alt="Provider Use Case - Node Gateways" src="/docs/assets/img/elastic-security-avs-use-case-node-gateways.png">
</p>

### 2.3 Operators

Operators of the AVS are appointed by investors who have re-staked from Ethereum into the system. Their primary mission is to maintain the state of the AVS, which includes several critical tasks:

- **Registry Management:** Operators manage the registry of providers, including their stakes in AVS tokens and the services they offer.
- **Purchase Tracking:** Operators keep track of purchases made by consumers, communicate them to providers, and collect the associated fees.
- **Performance Score Updates:** Operators maintain a registry of negative reviews and update performance scores based on the purchases made and applicable reviews.
- **Payment Processing:** Operators release payments to providers if they comply with conditions set by governance, including maintaining an acceptable performance score.

Operators play a crucial role in **governance**, with **the authority to penalize misbehaving providers and other operators** through AVS smart contract rules and governance procedures. Trust and scalability, the core value propositions of this AVS, rest on the proper functioning of operators and their ability to enforce the rules.

### 2.4 Investors

Investors in the AVS provide the financial resources necessary to sustain the network by re-staking their tokens. This re-staking forms the backbone of trust, enabling operators to function effectively and enforce the AVS rules.

Investors **earn returns** based on the network's performance, including a share of transaction fees or a portion of slashed tokens from faulty providers.

## 3. Economic Model

### 3.1 Utility Token

```
Summary
The Utility Token has several key functions:

- For Consumers: Used to purchase API calls from the AVS.
- For Providers: Used to stake in the AVS and collect revenue.
- For Operators and Investors: Utilized to collect rewards.
```

The introduction of a new utility token is crucial for **facilitating transactions within the Elastic Security AVS**. This token will be utilized by various participants, each playing a vital role in the network's functionality and growth.

Consumers will use the utility token to **purchase API calls**, allowing them to access services from providers within the AVS. This ensures a standardized method of payment within the network.

Providers offering security solutions and resources will **collect their revenue** in the utility token. Additionally, providers are required to **stake a value** in the AVS using the utility token. This stake comprises two parts:

- **A fixed amount:** Ensures commitment and participation in the AVS.
- **A variable amount:** Based on their revenue and performance score.

Operators (then investors) will **collect their rewards** in the utility token. Rewards are determined by a formula that considers the network's overall revenue, the number of registered providers, and enforcement activities.

The utility token will be **deployed on a Layer 2 network**, such as Linea. Layer 2 solutions are chosen for their scalability, lower transaction costs, and faster transaction times, which are essential for supporting the high volume of transactions expected within the AVS.

### 3.2 Governance Token

```
Summary
The Governance Token:

- Enables proposing and voting on AVS issues and disciplinary actions.
- Represents the amount re-staked by investors.
- Correlates with utility token rewards.
- Allocates to key stakeholders like developers and funders.
```

The governance token grants holders the ability to shape the AVS's development and ensure network security. Token holders can **propose and vote on new features, services, protocol upgrades, and changes to the AVS**. Additionally, governance token holders can **vote on disciplinary measures**, maintaining accountability and adherence to AVS rules.

Investors enhance network security by re-staking ETH into the AVS and delegating it to operators. **Re-staking rewards investors with governance tokens proportional to their staked amount**. To withdraw from the AVS, investors must return an equal number of governance tokens. Investor **earnings in utility tokens are tied to their governance token holdings**.

Accountability is enforced through slashing mechanisms, where users may lose governance tokens for misconduct or poor performance. Discrete governance tokens can also be allocated to **key stakeholders like developers and funders** to incentivize their contributions.

To prevent centralization, mechanisms should examine vote weights in a non-linear manner, considering token holding duration to ensure balanced influence.

### 3.3 Performance Score

```
Summary
Performance Score

- Each consumer purchase improves a provider's score.
- Negative reviews from consumers weaken a provider's score.
- The score is crucial for determining rewards and enforcing penalties for providers
```

Performance scores are crucial for evaluating, rewarding, and penalizing producers within the AVS. **Each consumer purchase contributes to a provider's performance score**, with repeated purchases significantly increasing their reputation. **Consumers can publish negative reviews for a fee** to call out poor-quality services, with the fee acting as a deterrent to prevent fraudulent reviews or Sybil attacks. Intersubjective mechanisms will be developed to allow providers to challenge a negative review.

After a specific period, **determined primarily by performance scores and AVS governance variables**, providers can retrieve fees from their purchases. The performance score is crucial in this process, as higher scores reduce the waiting time for fee retrieval.

## 4. Conclusion

This paper outlines the foundational blocks for developing a network that dynamically provides elastic security to Web3 users, assets, and products through the use of EigenLayer’s Actively Validated Service (AVS) technology.

Utilizing a marketplace model and incorporating staking mechanisms, performance scoring, and dedicated tokens, this approach aims to create a vibrant ecosystem where blockchain node providers compete to incorporate the most proficient security services into their gateways. The competition among nodes encourages security providers to specialize and continuously improve their offerings. Furthermore, streamlining this economy through a Web3-powered system for value exchange enhances decentralization.

The potential outcome of these efforts extends beyond a gathering system for security services and points to a comprehensive **marketplace for everything with an API**. This evolution will enable a diverse range of services to be seamlessly integrated into Web3, expanding possibilities for users and developers alike.
