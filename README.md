# 🕉️ Guru Parishad — Council of the Gurus of India

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Claude Code](https://img.shields.io/badge/Claude%20Code-plugin-8A63D2.svg)
![Gurus](https://img.shields.io/badge/gurus-7-orange.svg)

> Bring your hardest decision before **seven of the greatest Gurus of India**.
> They analyse it, cross-examine each other, and hand you one clear verdict.
> **One command: `/parishad`.**

When you're stuck in a genuine dilemma, what you need isn't more information — it's
*wisdom, from more than one angle*. Guru Parishad convenes a council of seven timeless
Indian minds — the strategist, the philosopher, the yogi, the logician, the counsellor,
the mystic, and the reformer — and runs them through a structured, multi-round
deliberation. You get back a verdict with the trade-offs named, the kill-criteria stated,
and a concrete next step.

It's a plugin for **[Claude Code](https://claude.com/claude-code)**.

## The 7 Gurus

| Guru | The lens they bring |
|------|---------------------|
| **Chanakya** (Kautilya) | Statecraft, power, incentives — *what actually secures the outcome, and what it costs.* |
| **Adi Shankaracharya** | Non-dual dialectic (*neti-neti*) — *strips away the false framing to what is truly real.* |
| **Patanjali** | Disciplined method — *still the mind's distortions first; your own bias is the first obstacle.* |
| **Nagarjuna** | Emptiness & interdependence — *nothing stands alone; examine every extreme via the middle way.* |
| **Vidura** | Dharma & honest counsel — *the difference between the clever move and the right one.* |
| **Ramakrishna Paramhansa** | Direct experience — *what does lived experience show? all paths point to one truth.* |
| **Swami Vivekananda** | Practical Vedanta — *arise, awake — turn the ideal into fearless action and service.* |

Each guru reasons by a **distinct method** (strategy, dialectic, introspection, logic,
ethics, experience, action), so the panel covers a genuinely wide field of view rather
than seven variations of the same answer.

Synthesis is handled by the **Sutradhaar** (सूत्रधार, "holder of the thread") — a named,
non-deliberating chairman who weaves the whole transcript into a single verdict. Name one
of the seven gurus as chairman with `--chairman` and that guru steps out of the debate to
synthesise instead.

## Requirements

[Claude Code](https://claude.com/claude-code). No API keys, no external services — the
council runs entirely on Claude.

## Install

**Option 1 — Plugin marketplace** (recommended)

```
/plugin marketplace add Wadhawnaiya/guru-parishad
/plugin install parishad@guru-parishad
```

**Option 2 — Install script**

```
git clone https://github.com/Wadhawnaiya/guru-parishad.git
cd guru-parishad
./install.sh
```

This copies the seven guru agents and the `/parishad` skill into `~/.claude/`. Useful flags:

- `--dry-run` — print the actions without writing any files
- `--claude-dir PATH` — install into a Claude config directory other than `~/.claude`

## Usage

```
/parishad <your hardest decision>
```

| Flag | Effect |
|------|--------|
| `--full` | Convene all 7 gurus |
| `--triad [domain]` | A predefined 3-guru panel for a domain (e.g. `ethics`, `strategy`, `debugging`) |
| `--members a,b,...` | Pick your own panel (2–5 gurus) |
| `--quick` | Fast 2-round mode for simpler questions |
| `--duo` | A 2-guru dialectic between an opposing pair |
| `--chairman [guru]` | Let a named guru synthesise the verdict (they then sit out the debate) |

With no flags, the coordinator reads your question and auto-selects the best-fitting triad.

**Examples**

```
/parishad Should we move from a single Postgres instance to a sharded multi-tenant setup before our next raise?
/parishad --full What is the right pricing strategy for our SaaS product?
/parishad --triad ethics Should we disclose the data-retention bug to customers before the fix ships?
/parishad --quick Should we add Redis caching to the auth flow?
/parishad --duo Should we rewrite the monolith as microservices?
```

See [`demos/session-pack.md`](demos/session-pack.md) for a worked set across every mode, and
[`demos/verdict-template.md`](demos/verdict-template.md) for a full example verdict.

## How It Works

1. **Round 1 — blind analysis.** Each convened guru works alone and produces an independent
   take, with no visibility into any other member's reasoning.
2. **Round 2 — anonymised cross-examination.** The panel challenges each other's positions,
   but identities are masked to labels like *Member A* — this suppresses conformity bias so
   members engage arguments on their merits, not on a familiar name.
3. **Round 3 — crystallisation.** Each guru states a final, declarative stance, which the
   coordinator tallies with **confidence-weighted** votes to find (or honestly fail to find)
   consensus.
4. **The verdict.** The full transcript — real names restored — goes to the **Sutradhaar**,
   who returns one structured verdict: recommendation, acceptable compromises, kill-criteria,
   a concrete next step, the vote tally, and a minority report for any strong dissent.

**Modes:** **Full** runs the complete 3-round sequence (most thorough) · **Quick** runs a
fast 2-round pass · **Duo** stages a head-to-head dialectic between an opposing pair.

## Acknowledgements

With gratitude to **[Council of High Intelligence](https://github.com/0xNyk/council-of-high-intelligence)**
by 0xNyk (MIT) — Guru Parishad adapts its deliberation protocol. The seven guru personas and
the Sutradhaar are original to this project.

## License

[MIT](LICENSE).
