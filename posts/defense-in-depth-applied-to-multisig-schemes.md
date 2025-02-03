# Defense in Depth Applied to Multisignature Schemes
_Timelocks and Circuit Breakers_

2025 Feb 03

<!-- MarkdownTOC levels="1,2,3" autolink="true" -->

- [Introduction](#introduction)
- [Implementing Defense in Depth with Timelocks and Circuit Breakers](#implementing-defense-in-depth-with-timelocks-and-circuit-breakers)
  - [Timelocks: Enforcing Delayed Execution for Risk Assessment](#timelocks-enforcing-delayed-execution-for-risk-assessment)
  - [Circuit Breakers: Stopping Suspicious Transactions Before Execution](#circuit-breakers-stopping-suspicious-transactions-before-execution)
- [Conclusions](#conclusions)
  - [Summary of Defense-in-Depth Approach](#summary-of-defense-in-depth-approach)
  - [Additional measures](#additional-measures)
  - [Trade-offs & Challenges](#trade-offs--challenges)
  - [Technical Alternatives](#technical-alternatives)
- [References](#references)

<!-- /MarkdownTOC -->

## Introduction

In DeFi, multisig wallets are central to governance and fund management, ensuring that key transactions (like smart contract upgrades and treasury management) require multiple signers. While this design minimizes single points of failure and reinforces decentralization, it faces challenges such as key takeover attacks, impersonation via social engineering, and even physical coercion.

<p style="text-align: center;">
  <img width="600" src="/docs/assets/img/did-multisig-01.png">
</p>

To counter these threats, we propose a defense-in-depth strategy that integrates **timelocks** and **circuit breakers**. These mechanisms introduce multi-stage verification and intervention, enhancing security and governance in an increasingly complex threat landscape.

<p style="text-align: center;">
  <img width="600" src="/docs/assets/img/did-multisig-02.png">
</p>

## Implementing Defense in Depth with Timelocks and Circuit Breakers

### Timelocks: Enforcing Delayed Execution for Risk Assessment

Timelocks add a deliberate delay between multisig approvals and transaction execution. This pause provides a window for risk assessment and anomaly detection, allowing security teams to review and verify transactions before they go live.

#### Implementation

After multisig approval, a transaction enters a locked state. During this period, monitoring systems (e.g., a SOC) can review the transaction and log all relevant events for forensic purposes.

#### Benefits

* Detects compromised or fraudulent transactions early.
* Mitigates risks like coercion and fraud by adding a safety buffer.
* Supports a time-delayed upgrade pattern for greater flexibility.

#### Challenges

Urgent transactions are delayed unless an override mechanism exists.

#### Standards Alignment

* NIST SP 800-53B
  * SI-4 (System Monitoring): Ensures continuous oversight during the delay period.
  * CA-7 (Continuous Monitoring): Supports ongoing assessment of transaction states.
  * AU-2 / AU-6 (Audit Events & Audit Review, Analysis, and Reporting): Mandates comprehensive logging for forensic analysis.
* NIST SP 800-37 (Risk Management Framework – Select Step, Section 3.3): Organizations are instructed to tailor baseline controls to reflect their unique mission, operational environment, and risk tolerance. This approach mandates that the monitoring of multisig transactions is scaled in accordance with the inherent risk of each execution.

<p style="text-align: center;">
  <img width="600" src="/docs/assets/img/did-multisig-03.png">
</p>

### Circuit Breakers: Stopping Suspicious Transactions Before Execution

Circuit breakers act as emergency stops for transactions flagged as risky, fraudulent, or coerced.

#### Implementation

* If a transaction is detected as anomalous, a circuit breaker can be triggered to prevent finalization.
* This may be activated by:
  * A SOC review flagging an issue.
  * Automated anomaly detection identifying irregularities.
  * Signers forced to approve under coercion.

#### Benefits

* Allows transactions to be halted even after multisig approval if risk is detected.
* Provides a critical fail-safe against coercion and fraud.

#### Challenges

* Requires clear governance rules on who can trigger a circuit breaker.
* Relies on trust in the entity (SOC or DAO members) overseeing cancellations.

#### Standards Alignment

* NIST SP 800-53B
  * IR-4 (Incident Handling): Outlines prompt response and mitigation of anomalous events.
  * CP-2 (Contingency Planning): Supports establishing procedures to suspend operations under emergency conditions.
* NIST SP 800-37 (Risk Management Framework – Select Step, Section 3.3): Encourages tailoring controls based on an organization’s unique risk profile, ensuring that measures like circuit breakers are proportionate to the risk of each transaction.

## Conclusions

Threat actors are becoming more sophisticated, using advanced techniques to compromise governance—from automated impersonation to coercion. A defense-in-depth approach is essential.

### Summary of Defense-in-Depth Approach

* **Timelocks** provide a delay for oversight and risk assessment.
* **Circuit Breakers** act as emergency stops for suspicious transactions.
* Together, these mechanisms create a robust, multi-layered security model.

### Additional measures

* Use hardware wallets for multisig key storage.
* Operate critical systems on dedicated, isolated devices. [@_iphelix](https://newsletter.blockthreat.io/p/blockthreat-week-42-2024) suggests "_Dedicated hosts for all critical administrative actions. A cheap $200 Chromebook is sufficient. The key is 'dedicated'. So no browsing, tweeting, checking emails or job applicant reviews._"
* Quoting [@_iphelix](https://newsletter.blockthreat.io/p/blockthreat-week-23-2024), "_You will not go bankrupt from buying a laptop to prevent losing private keys when a contractor decides to pirate games on their shared dev box_"

### Trade-offs & Challenges

* Timelocks: Enhance security with delays but can slow down urgent transactions. An override mechanism may be necessary.
* Circuit Breakers: Require clear governance and trusted oversight to be effective.
* Decentralized SOC Functions: Must be integrated within governance to enable swift responses.
* Enhanced Multisig Modules: Offer improved security but come with extra maintenance and auditing overhead.

### Technical Alternatives

The following approaches avoid the need for additional modules in a multi-signature wallet:

#### Multi-Tiered Governance System

Access control becomes increasingly stringent as risk rises. Higher-risk actions require more signers and a higher approval threshold.

#### Sequenced MultiSig Wallets

A two-phase signature process—initial multisig collection followed by additional signatures from a separate group—integrates governance monitoring directly into the approval process.

## References

* [NIST SP 800-53 Rev. 5](https://csrc.nist.gov/pubs/sp/800/53/r5/upd1/final) – Security & Privacy Controls for Information Systems
* [NIST SP 800-37 Rev. 2](https://csrc.nist.gov/pubs/sp/800/37/r2/final) – Risk Management Framework
* [Blockchain Threat Intelligence](https://newsletter.blockthreat.io/)
  * [Blockthreat Week 23, 2024](https://newsletter.blockthreat.io/p/blockthreat-week-23-2024)
  * [Blockthreat Week 42, 2024](https://newsletter.blockthreat.io/p/blockthreat-week-42-2024)
