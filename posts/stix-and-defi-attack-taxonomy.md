# Arguments in favor of a standard for incident reporting and DeFi attack taxonomy

2024 Apr 19

## Overview

To systematically address and mitigate risks, it is recommended to incorporate a standard for incident reporting and develop a comprehensive taxonomy of attacks specific to DeFi systems.

By leveraging the Structured Threat Information Expression [STIX], a recognized framework in the threat intelligence community, information can be stored in JSON format. This makes it easily machine-readable and provides a visually-represented interface for analysts. This powerful combination enables automation, facilitates quick and efficient threat intelligence consumption and dissemination, and supports the training of security professionals and operators.

Drawing inspiration from scholarly work such as [Zhou et al. 2022] it is possible to lay the foundations for an ever-evolving system that classifies incidents into layers, causes, and types. This taxonomy should encompass the wide variety of attack vectors in DeFi such as Sybil attacks, 51% attacks, reentrancy, frontrunning, sandwiching, on-chain oracle manipulation, and wallet phishing. Each category should clearly define the vulnerabilities, potential impacts, and typical mitigation strategies.

## SoK: Decentralized Finance (DeFi) Attacks

The framework developed by [Zhou et al. 2022] can be regarded as a superset of the relevant work done in DeFi security taxonomies. Therefore, it will be utilized in this review to structure the organization of attack vectors and provide non-exhaustive examples within the DeFi ecosystem.

<p style="text-align: center;">
  <img width="600" alt="Screenshot 2024-04-18 at 23 24 38" src="https://gist.github.com/assets/85324266/ef5cdaf9-ddac-4cc6-a015-9cd490af6b27">
</p>

1. Network Layer (NET): The Network Layer of the DeFi Reference Frame consists of the Network Communication Infrastructure, Blockchain and Peer-to-Peer (P2P) Networks, and Front-running as a Service (FaaS). The role of this layer is to enable communication among other system layers.
2. Blockchain Consensus Layer (CON): The Consensus Layer describes the underlying blockchain and consists of a Consensus Mechanism (which enables nodes to reach agreement on a single state), Nodes, and their Operation Protocol (miners, validators, or ordinary nodes responsible for propagation).
3. Smart Contract Layer (SC): The State is a critical component in this layer, performing Transitions via Transactions that run the code contained in Smart Contracts. The sequential grouping of transactions into blocks results in a Block State Transition.
4. DeFI Protocol Layer (Pro): The layer comprises Cryptocurrency protocols, Financial Protocols, and Protocol Layer Incentive Mechanisms. The vulnerabilities in this layer may resemble financial market manipulation rather than technical exploits.
5. Auxiliary Services (AUX): Auxiliary services are entities that are essential for the efficient functioning of DeFi but are not part of the four primary layers of the reference frame, namely NET, CON, SC, and PRO. Examples of such services include DeFi project websites (UI), exchange administrators, centralised oracles, and crypto wallets, among others.

Each of these layers categorize incident causes and distinguish types:

<p style="text-align: center;">
  <img width="600" src="https://gist.github.com/assets/85324266/f58891dc-7125-4bfe-88bf-55e1bfc5baf3">
  <img width="600" src="https://gist.github.com/assets/85324266/401d86f6-4b59-49b2-bdd4-5bde53df3aa9">
  <img width="600" src="https://gist.github.com/assets/85324266/e9299dd0-642c-420d-893b-ec27e65f10e6">
  <img width="600" src="https://gist.github.com/assets/85324266/796bff6b-5c15-40f7-9cc2-1da0f2563d5d">
  <img width="600" src="https://gist.github.com/assets/85324266/04f1e0a3-a2de-40ed-9011-17a83253e493">
</p>

## Extending STIX for incident reporting and DeFi Attack Taxonomy

[Clancy et al. 2022] offered policy recommendations for Web3 security. They suggested extending the STIX taxonomy in three ways: defining wallet identifiers and Ethereum node records as observables, including blockchain transactional records as indicators, and incorporating financial misgivings in defining incidents.

The following extensions to the standard are proposed:

* Cyber-observable objects (SCOs) for blockchain addresses and transactions:
  * `x-defi-address` and `x-defi-transaction`.
* A required property added to the report SDO, representing the financial loss in US Dollars resulting from an incident:
  * `x_defi_estimated_loss_usd`.
* Required properties added to the attack-pattern SDO, inspired by the comprehensive five-layer taxonomy of DeFi incidents presented by [Zhou et al. 2022]:
  * `x_defi_taxonomy_layer`.
  * `x_defi_taxonomy_incident_cause`.
  * `x_defi_taxonomy_incident_type`.

## STIX Implementation Examples

<p style="text-align: center;">
  <img width="600" alt="Screenshot 2024-04-18 at 23 39 09" src="https://gist.github.com/assets/85324266/1dfcebba-c926-47bf-a7a6-681c32ec9c67">
  <img width="600" alt="Screenshot 2024-04-18 at 23 39 17" src="https://gist.github.com/assets/85324266/550bdf5b-e8e3-445b-b387-4846b4abe192">
  <img width="600" alt="Screenshot 2024-04-18 at 23 39 26" src="https://gist.github.com/assets/85324266/44957eea-68c1-401c-9a7c-f38b9dac8852">
  <img width="600" alt="Screenshot 2024-04-18 at 23 39 35" src="https://gist.github.com/assets/85324266/12cb8a5e-3a5d-4758-925f-40dfc72f9cc0">
  <img width="600" alt="Screenshot 2024-04-18 at 23 39 54" src="https://gist.github.com/assets/85324266/b37886ca-73e8-4dc4-8c0a-1bfa3d7a3218">
</p>

## References

* [Clancy et al. 2022]
  * Clancy, C., Norman, M., & Wijesinghe, S. (2022). Securing Web3 and Winning the Battle for the Future of the Internet. MITRE. [https://www.mitre.org/news-insights/publication/securing-web3-and-winning-battle-future-internet](https://www.mitre.org/news-insights/publication/securing-web3-and-winning-battle-future-internet)

* [STIX]
  * Barnum, S. (2012). Standardizing Cyber Threat Intelligence Information with the Structured Threat Information Expression (STIX). Mitre Corporation, 11, 1–22. [https://www.mitre.org/sites/default/files/publications/stix.pdf](https://www.mitre.org/sites/default/files/publications/stix.pdf)

* [Zhou et al. 2022]
  * Zhou, L., Xiong, X., Ernstberger, J., Chaliasos, S., Wang, Z., Wang, Y., Qin, K., Wattenhofer, R., Song, D., & Gervais, A. (2022). SoK: Decentralized Finance (DeFi) Attacks. [http://arxiv.org/abs/2208.13035](https://www.mitre.org/sites/default/files/publications/stix.pdf)

## Contact

* Twitter: [@bentobox19\_](https://twitter.com/bentobox19_)
