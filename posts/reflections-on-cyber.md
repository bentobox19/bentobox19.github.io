---
title: Reflections on Cybersecurity Policy
date: 2026-08-14
---

## 1. Introduction

In late July, I attended Harvard Kennedy School's executive course *Cybersecurity: The Intersection of Policy and Technology*. I wanted to hear how people working in Western cybersecurity policy understand the present moment, and to observe first-hand how they frame its problems. This post collects my reflections from that week.

<div style="text-align: center">
  <img width="600" src="/docs/assets/img/reflections-on-cyber-group.png" alt="Group photo from the Cybersecurity executive course at Harvard Kennedy School">
</div>

## 2. AI as an Accelerator

Artificial intelligence came up in many discussions during the course. In the cyber domain, AI is a force-multiplier for attackers and defenders, who are no longer constrained by human limitations. Rather than concern about AI replacing cyber professionals, the focus was on the ability to contain attacks coming from actors enhanced by these tools, and the risk of unchecked automation, which raises the question of who is ultimately liable for the actions of a rogue model.

Looking back on the program, I kept returning to *language* as a theme throughout the presentations and group discussions. The idea of controlling large language models by applying guardrails runs into a fundamental problem: since anything expressed in language can be reinterpreted at will, there is no bound on the number of interpretations, and no finite set of rules can contain them.

One case study we examined was the Hugging Face incident of July 2026.[^1][^2][^3] The models did what they were told to do; they went as far as their goals and reward functions told them to go. The challenge is that any constraint is written in the same language it seeks to constrain, which makes it underspecified. Like King Midas, whose wish was granted literally, the model does exactly what it is told: everything touched turns to gold, food and daughter included.

The coming years in cyber will be turbulent due to AI. Its force-multiplier effect accrues to attackers first and most. Defenders will try to catch up. This will not happen soon, but I expect equilibrium to emerge. This is my optimistic takeaway.

## 3. Infrastructure and Trust

The modern economy is built on brittle foundations. Society trusts digital infrastructure by default, but the more you look, the more cracks you find. TCP/IP, the networking protocol suite over which the internet runs, wasn't designed for today's security environment. Hardware supply chains are highly complex and vulnerable to tampering, counterfeiting, and espionage. As for software, companies have perverse incentives to ship fast and patch later. Distributed *as is* (e.g. “Please do not use it for anything important”), software does not expose its vendors to the same liability that the builder of a bridge would face should it collapse.

The cat-and-mouse game between hackers exploiting flaws and defenders patching them has only accelerated with the arrival of large language models. Two markets have grown around it: black markets pay for zero-day vulnerabilities, while white-hat platforms such as HackerOne and Immunefi run bug-bounty programs. Security researchers today find vulnerabilities faster than ever. Microsoft's July 2026 Patch Tuesday shipped 570 fixes, three of them for zero-days.[^4] Some applications ship updates almost daily. Other mission-critical deployments don't have that luxury: you cannot just update to a new version and pipe new requests into it. These efforts look Sisyphean at that scale. Did AI break the system? Or did it just expose the fragility of its foundations?

I already reflected on the coming intensity and how it will only increase for a while. Until we reach an equilibrium, the most sensible measure is to commit to zero trust. *Assume your system is already compromised.* Add deliberate friction. Always use multiple factors of authentication. Use hardware devices to store your keys. Put AI to work on fine-grained monitoring and alerting. Think like your attacker, and invest inference tokens in finding vulnerabilities in your products.

## 4. Conflict Below the Threshold of War

Cyber attacks resist simple classification. When a malicious actor, working alone or on behalf of an organization, carries out an attack, there is no simple way to catalog it, let alone respond to it. The 2007 attacks on Estonia[^5] and the 2014 hack of Sony Pictures[^6] caused significant harm, yet no conventional military response followed.

Obama called the Sony attack *cybervandalism*.[^7] Adversaries recognized the existence of a sub-threshold space and learned to operate within it. Lucas Kello calls this condition *unpeace* (neither war nor peace), a state in which countries harm each other without crossing into armed conflict.[^8] Cyber operations are relatively cheap and deniable, disrupting the interaction of states — Kello's third-order revolution, systemic disruption; empowering revisionist or rogue states — his second-order revolution, the revolutionary state; and, in the most severe cases, enabling non-state entities to challenge the supremacy of traditional sovereign states — first-order pressures from outside the states system.

My industry, Web3, operates in this sub-threshold space. In February 2025, the FBI attributed the $1.5 billion Bybit theft to the DPRK's Lazarus Group.[^9] Even with a clear attribution, law enforcement stops at the border. So Bybit went to court itself. On August 7, 2026, Bybit sued the DPRK, its Reconnaissance General Bureau, and the Lazarus Group in federal court, securing an asset freeze.[^10] Nobody expects to see North Korea's leadership in that courtroom. The suit's real function is to activate the mechanisms that break the laundering chain.

## 5. Communication Is Security Work

Earlier I called *language* the thread running through the course. The same property of language that defeats guardrails (no finite set of rules can contain an unbounded interpretation space) is the practitioner's problem in human form. The hardest question in AI, infrastructure, and international conflict alike was how to communicate risk to the people who must decide and act on it.

My most useful takeaway from the course had nothing to do with technology. *Security will fail when it cannot be communicated.* The job runs in two directions. With stakeholders, you talk to win policy and budget: technical risks compete for funding against visible business priorities, and if leadership cannot understand a risk, it effectively does not exist. With colleagues, you talk to implement: good practice clashes with daily habits. How do you train front-line collaborators who inherently trust the infrastructure?

There is no shortcut to the equilibrium I expect: conditions will deteriorate for a while first. Preparation is technical — zero trust, hardened infrastructure, and AI on our side — but it is above all a matter of people: building a *common language* between those who secure systems and those who decide their fate.

## 6. References

[^1]: Hugging Face, *Security incident disclosure — July 2026*, July 2026. <https://huggingface.co/blog/security-incident-july-2026>

[^2]: OpenAI, *OpenAI and Hugging Face partner to address security incident during model evaluation*, July 2026. <https://openai.com/index/hugging-face-model-evaluation-security-incident/>

[^3]: Hugging Face, *Anatomy of a Frontier Lab Agent Intrusion: A Technical Timeline of the July 2026 Incident*, July 2026. <https://huggingface.co/blog/agent-intrusion-technical-timeline>

[^4]: BleepingComputer, *Microsoft July 2026 Patch Tuesday fixes massive 570 flaws, 3 zero-days*, July 2026. <https://www.bleepingcomputer.com/news/microsoft/microsoft-july-2026-patch-tuesday-fixes-massive-570-flaws-3-zero-days/>

[^5]: Rain Ottis, *Analysis of the 2007 Cyber Attacks Against Estonia from the Information Warfare Perspective*, Cooperative Cyber Defence Centre of Excellence, 2008. <https://ccdcoe.org/uploads/2018/10/Ottis2008_AnalysisOf2007FromTheInformationWarfarePerspective.pdf>

[^6]: FBI, *Update on Sony Investigation*, December 19, 2014. <https://www.fbi.gov/news/press-releases/update-on-sony-investigation>

[^7]: NPR, *Obama Calls North Korean Hack 'Cybervandalism'*, December 21, 2014. <https://www.npr.org/sections/the-two-way/2014/12/21/372271870/obama-calls-north-korean-hack-cybervandalism>

[^8]: Lucas Kello, *The Virtual Weapon and International Order*, Yale University Press, 2017.

[^9]: FBI, *North Korea Responsible for $1.5 Billion Bybit Hack*, February 2025. <https://www.fbi.gov/investigate/cyber/alerts/2025/north-korea-responsible-for-1-5-billion-bybit-hack>

[^10]: Bybit, *Bybit Sues North Korea and Lazarus Group*, August 7, 2026. <https://www.bybit.com/en/press/post/bybit-sues-north-korea-and-lazarus-group-secures-preliminary-injunction-freezing-stolen-assets-in-landmark-crypto-asset-recovery-effort-bb55bb16f1710f487aa>

