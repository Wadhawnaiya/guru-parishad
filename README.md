# Guru Parishad — Council of the Gurus of India

Seven gurus of India deliberate your hardest decisions — structured multi-round
deliberation, synthesized into one verdict by the Sutradhaar. One command: `/parishad`.

## The 7 Gurus

| Guru | Lens |
|------|------|
| Chanakya (Kautilya) | Statecraft, power & incentives |
| Adi Shankaracharya | Non-dual dialectic (neti-neti) |
| Patanjali | Disciplined method & mind-mastery |
| Nagarjuna | Emptiness & interdependence |
| Vidura | Dharma, ethics & counsel |
| Ramakrishna Paramhansa | Direct experience; harmony of paths |
| Swami Vivekananda | Practical Vedanta — action & service |

Synthesis is handled by the **Sutradhaar** (सूत्रधार, "holder of the thread") — a
named, non-deliberating chairman who weaves the council's transcript into a
single verdict. You can also name one of the 7 gurus as chairman with
`--chairman`, in which case that guru sits out deliberation.

## Install

**Option 1 — Plugin marketplace**

Add this repo as a plugin marketplace in Claude Code, then install the `parishad` plugin (marketplace name `guru-parishad`, per `.claude-plugin/marketplace.json`):

```
/plugin marketplace add <owner>/<this-repo>
/plugin install parishad@guru-parishad
```

**Option 2 — Install script**

```
./install.sh
```

Installs the 7 guru agents and the `/parishad` skill into `~/.claude/`. Useful flags:

- `--dry-run` — print the actions without writing any files
- `--claude-dir PATH` — install into a Claude config directory other than `~/.claude`

## Usage

| Flag | Effect |
|------|--------|
| `--full` | All 7 gurus |
| `--triad [domain]` | Predefined 3-guru combination |
| `--members name1,name2,...` | Manual selection (2–5) |
| `--quick` | Fast 2-round mode |
| `--duo` | 2-guru dialectic using polarity pairs |
| `--chairman [guru]` | Override the Sutradhaar synthesizer with a named guru (who then sits out deliberation) |

Examples:

```
/parishad Should we move from a single Postgres instance to a sharded multi-tenant setup before our next funding round?
/parishad --full What is the right pricing strategy for our SaaS product?
/parishad --triad ethics Should we disclose the data-retention bug to customers before we've finished the fix?
/parishad --quick Should we add Redis caching to the auth flow?
/parishad --duo Should we rewrite the monolith as microservices?
```

See `demos/session-pack.md` for a full worked set of example invocations across every mode.

## How It Works

Each convened guru first works alone, in Round 1, producing an independent
analysis with no visibility into any other member's reasoning. In Round 2 the
panel cross-examines each other's positions, but with identities anonymized
to labels like "Member A" — this suppresses conformity bias so members engage
arguments on their merits rather than deferring to a familiar name. Round 3
crystallizes each member's final, declarative stance, which the coordinator
tallies with confidence-weighted votes to find (or fail to find) consensus.
The full transcript — all three rounds, real names restored — is then handed
to the Sutradhaar, who synthesizes it into a single structured verdict.

## Modes

- **Full** — all convened gurus run the complete 3-round sequence (blind analysis, anonymized cross-examination, crystallized verdict); the most thorough mode.
- **Quick** — a fast 2-round sequence (rapid analysis, then anonymized final positions) for simpler questions.
- **Duo** — a 2-guru dialectic between a chosen polarity pair, for rapid opposing perspectives on a question.

## Credits

The deliberation protocol (blind-first analysis, anonymized cross-examination,
confidence-weighted tie-breaking, Chairman-synthesized verdict) is adapted
from [Council of High Intelligence](https://github.com/0xNyk/council-of-high-intelligence)
by 0xNyk, distributed under the MIT License. The 7 guru personas and the
Sutradhaar theme are original to this project.
