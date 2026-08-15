---
title: Reflections on Cybersecurity Policy
date: 2026-08-14
---

## 1. Introduction

In late July, I spent a week at the Harvard Kennedy School's executive course *Cybersecurity: The Intersection of Policy and Technology*. I left with a yellow pad full of notes. Those notes became this post.

One word recurred in my notes: _language_. We need a shared vocabulary to argue with leaders about risks, to train colleagues who will face them, to tell the public what holds their lives up. All three trust infrastructure they cannot inspect. Most do not know how fragile it is.

The academy has no settled theory of cyber conflict. The military strategizes with doctrines built for kinetic war. France lost in six weeks with more tanks than Germany: it lacked the theory to use them. Cyber is that gap now. Attacks arrive every day, and almost none count as acts of war. The field calls it sub-threshold. It is a line drawn in words, and an attacker can stay just beneath it.

AI already outpaces us in cyber. AI is faster, broader, and deeper in what it can find and exploit. We try to bound it with guardrails written in language. Language is not finite, and the guardrails will not hold.

## 2. Digital Infrastructure

A submarine cable, once cut, takes weeks to repair. The software running your bank is shipped *as is*. Both hold up lives, and neither was built to be inspected.

This is digital infrastructure, and it was laid down without a security model. TCP/IP assumed the nodes on the wire were friendly. Physical producers face liability for what they ship; software vendors do not. The asymmetry is not an oversight. It is the reason the system got everywhere so fast.

That speed came at a cost. Trust is unavoidable — no one inspects every layer of the stack. But trust placed by default is trust surrendered. If you don't have an opinion, you're implicitly trusting.

Black markets pay for zero-day vulnerabilities. Nation-state actors insert themselves into the supply chain. AI now finds bugs at a scale no human team can match. Microsoft's July 2026 Patch Tuesday shipped 570 fixes, three of them zero-days.[^1] Programs like HackerOne and Immunefi look sisyphean against that scale. AI didn't break the system. It exposed how fragile the foundations already were.

My industry inherits the whole stack. Web3 adds its own dependencies on top — smart contracts, oracles, bridges — layers traditional finance doesn't carry. The deeper you go, the more cracks you see. My move is to keep pushing zero trust further: *assume the attacker is already inside our machines, and design so that assumption is survivable.* Concretely, that means deliberate friction around the private key — hardware wallets, MPC schemes, quorum policies — so that no compromised endpoint or trusted insider can move funds alone.

## 3. International Cyber Conflict

In 2007, weeks of coordinated attacks took down Estonia's government sites, banks, and newspapers. No one could agree on what to call it.

Clausewitz defined war by three traits: violent, between states, serving a political end. A cyber-attack fails each. Its weapons are nonphysical; its actors carry no flag; deniability is by design. Is a cyber-attack an act of war? Estonia didn't meet the line. Neither did the Sony Pictures hack of 2014. Obama called it *cybervandalism*. Adversaries learned the threshold, and learned to operate below it.

Lucas Kello names the condition *unpeace* — neither war nor peace, a state in which states harm each other without crossing into armed conflict.[^2] Cyber operations are cheap and deniable; they alter how states interact, empower the revolutionary, and erode the state's monopoly on force.

The gap below that line has two faces. It rewards the cunning — submarines in WWI and Blitzkrieg in WWII each punished the side with the better inventory and the worse doctrine. It also lets states contest without escalating to kinetic war. Operating there is an attacker's advantage; it is also a pressure valve. From British hegemony through the Cold War and Pax Americana, the order was hierarchical. It isn't now.

The shift is from security to resilience. Offense holds the structural advantage; the adversary cannot be kept outside. The assumption I make for the devices in my domain ("*the attacker is already inside*") is the one states must now make for their nations.

For my industry, the threat is concrete. In February 2025 the FBI attributed the $1.5 billion Bybit theft to the DPRK's Lazarus Group — the largest single loss on record.[^3] Even when attribution succeeds, law enforcement stalls at the border. On August 7, 2026, Bybit sued the DPRK, its Reconnaissance General Bureau, and the Lazarus Group in federal court, securing an asset freeze.[^4] A lawsuit is what enforcement looks like when the threshold cannot be crossed. The same liability gap I described between software vendors and their customers, now between states.

## 4. The AI Question

Put a power tool in a skilled carpenter's hands and he builds faster; put it in a novice's and he loses a finger. Large language models work the same way. In a professional's hands they add speed, scale, and reach; in a junior's they substitute for the judgment he hasn't earned yet. That is creative destruction — the old tasks go, and new ways of learning come with them. The future belongs to the enhanced professional. The road there is rocky, and society is moving down it at breakneck speed.

Gerrymandering draws a district the law permits but no one intended. High-frequency trading wins on a millisecond the exchange never designed for. A tax loophole is a deduction the code allows and the legislature never meant. A Formula 1 team spends millions on a wing that passes inspection by bending a rule's intent. Each is a system doing what it was built to allow, and nothing it was meant to do. That is hacking. The hacker finds the gap between permitted and intended, and he is bound by the usual limits — he needs to sleep, he can attend for only so long, he lives inside the rules of a physical world. AI systems are not bothered by these restrictions.

Tell your assistant to book you a slot at the gym and it may find the gym's API and unschedule other users to make room. It was never told not to. It took the mandate literally. The tale of King Midas is the same prompt, "*Whatever I touch, make it gold*", and it has not aged. This is why a perfect guardrail is mathematically impossible. Language is unbounded and any set of rules is finite. Given time, the model finds the gap. It does not understand context yet, and context is exactly what a guardrail cannot encode.

Who is liable when the system complies — the lab that trained it, the company that deployed it, or the user who asked? Open-source models make the chain longer. We can tell a man not to smoke inside a bar and enforce it; we cannot enforce what a model may teach a user in private. Enforcement is the problem, for two reasons that will not bend. The user's privacy is one. The speed of the technology is the other. Set a policy today and the model it targets is already two generations old. Nobody can say what this looks like in six months, let alone in three years. The forecast is dark: *Things will get worse, probably for a long time, before they get better.*

## 5. Conclusion

The most useful lesson was the least technical: security fails when it cannot be communicated. Reducing a risk to talking points a board can approve is not a soft skill bolted onto the real work. It is the work. This lands on my own priority — securing resources for proactive vulnerability discovery in our smart contracts. In web3, a single exploited contract is not an incident, it is an extinction event. That argument wins budget only when I translate it from engineering language into the fiduciary language leadership can act on. Audits, fuzzing, formal verification, bounties — these are insurance against irreversible loss, not engineering nice-to-haves. If leadership cannot understand a risk, it effectively does not exist in the budget.

[^1]: BleepingComputer, *Microsoft July 2026 Patch Tuesday fixes massive 570 flaws, 3 zero-days*, July 2026. <https://www.bleepingcomputer.com/news/microsoft/microsoft-july-2026-patch-tuesday-fixes-massive-570-flaws-3-zero-days/>

[^2]: Lucas Kello, *The Virtual Weapon and International Order*, Yale University Press, 2017.

[^3]: FBI, *North Korea responsible for $1.5 billion Bybit hack*, Cyber Alert, February 2025. <https://www.fbi.gov/investigate/cyber/alerts/2025/north-korea-responsible-for-1-5-billion-bybit-hack>

[^4]: Bybit, *Bybit Sues North Korea and Lazarus Group, Secures Preliminary Injunction Freezing Stolen Assets*, August 7, 2026. <https://www.bybit.com/en/press/post/bybit-sues-north-korea-and-lazarus-group-secures-preliminary-injunction-freezing-stolen-assets-in-landmark-crypto-asset-recovery-effort-bb55bb16f1710f487aa>
