# Guru Parishad

## Architecture

- `skills/parishad/SKILL.md` — coordinator protocol: execution sequence, modes (full/quick/duo), reference tables (triads, polarity pairs), and verdict templates (canonical — all protocol changes land here)
- `agents/parishad-*.md` — 7 guru member personas with YAML frontmatter (Chanakya, Shankara, Patanjali, Nagarjuna, Vidura, Ramakrishna, Vivekananda)
- `install.sh` — installs agents and the skill into `~/.claude/`
- `.claude-plugin/plugin.json`, `.claude-plugin/marketplace.json` — plugin manifests for marketplace install
- `demos/` — example `/parishad` invocations and a verdict template walkthrough

## Conventions

### Agent files

- Section order: Identity → Grounding Protocol → Analytical Method → What You See That Others Miss → What You Tend to Miss → When Deliberating in Council → Output Format (Council Round 2) → Output Format (Standalone)
- Grounding Protocol appears **immediately after Identity** (LLMs weight earlier instructions more heavily)
- "What You See" and "What You Tend to Miss" sections: ≤3 sentences each
- Every agent gets a Council Round 2 output format with structured headers (Disagree, Strengthened by, Position Update, Evidence Label)

### `parishad:` frontmatter block

Every agent carries a `parishad:` YAML block with `figure`, `domain`, `polarity`,
`polarity_pairs`, `triads`, `duo_keywords`, and `reasoning_method`. **Each of the
7 gurus must carry a distinct `reasoning_method`** — this is the method-diversity
guarantee (DMAD, arXiv:2410.12853) that the coordinator enforces when
substituting members. Current assignments: `strategic-realpolitik` (Chanakya),
`dialectical-negation` (Shankara), `disciplined-introspection` (Patanjali),
`tetralemma-emptiness` (Nagarjuna), `dharmic-niti` (Vidura),
`experiential-parable` (Ramakrishna), `karma-yoga-action` (Vivekananda). When
adding or swapping a guru, pick a `reasoning_method` that doesn't collide with
any existing one.

### `skills/parishad/SKILL.md`

- Coordinator instructions are an **execution sequence** with numbered STEPs and `[CHECKPOINT]`/`[VERIFY]` markers
- Three modes: full (3-round), quick (2-round), duo (dialectic)
- Reference tables (Council Members, Polarity Pairs, Pre-defined Triads, Duo Polarity Pairs) live below the execution sequence, not mixed into it

### Style

- Keep agent prompts tight — no filler sentences
- Grounding protocols use specific numeric constraints ("2-aphorism cap", "at most the two most probable adversary responses"), not vague guidance
- Each agent's `Output Format (Council Round 2)` block is identical across all members (a shared, self-contained structure so every agent file stands alone); only the `Output Format (Standalone)` headers are lens-specific

### Claude-only

This plugin is Claude-only. Do not reintroduce provider routing, provider
profiles, or mirrors for other coding agents (e.g. codex/gemini/opencode-style
compressed SKILL.md variants, `--models`/`--profile` flags, provider-affinity
config). Every seat dispatches as a Claude Code subagent using the guru's
frontmatter `model` (opus/sonnet); the Sutradhaar always runs as a Claude
opus subagent. If a future task proposes multi-provider dispatch, treat it as
out of scope for this plugin and flag it before implementing.

### Testing

- Run `./install.sh --dry-run` after any change to `agents/` or `skills/parishad/SKILL.md`
- After coordinator (SKILL.md) changes, grep `skills/parishad/SKILL.md` for dropped-machinery tokens left over from the source protocol this plugin was adapted from — leftover agent-name prefixes, non-Claude CLI names, or provider-routing/model-selection flags. This should find nothing. If it does, remove the offending term.
- Test at least one mode (full/quick/duo) end to end after protocol changes
