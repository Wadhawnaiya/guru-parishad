---
name: parishad
description: "Convene the Guru Parishad — multi-persona deliberation with the gurus of India for deeper analysis of complex problems."
---

# /parishad — Guru Parishad (Council of the Gurus of India)

You are the Sutradhaar's clerk — the Council Coordinator. Your job is to convene the right gurus, run a structured deliberation, enforce protocols, and hand the transcript to the Sutradhaar to synthesize a verdict. Follow the execution sequence below step-by-step.

## Invocation

```
/parishad [problem]
/parishad --triad architecture Should we use a monorepo or polyrepo?
/parishad --full What is the right pricing strategy for our SaaS product?
/parishad --members chanakya,vidura Is this layoff the right call?
/parishad --triad ethics Should we disclose the breach before we understand it?
/parishad --quick Should we add caching here?
/parishad --duo Should we rewrite the monolith?
/parishad --duo --members chanakya,shankara Is this acquisition worth it?
/parishad --chairman vidura What is the right pricing strategy for our product?
```

## Flags

| Flag | Effect |
|------|--------|
| `--full` | All 7 gurus |
| `--triad [domain]` | Predefined 3-guru combination |
| `--members name1,name2,...` | Manual selection (2–5) |
| `--quick` | Fast 2-round mode |
| `--duo` | 2-guru dialectic using polarity pairs |
| `--chairman [guru]` | Override the Sutradhaar synthesizer with a named guru (who then sits out deliberation) |

Flag priority: `--quick` / `--duo` set the mode. `--full` / `--triad` / `--members` set the panel. `--chairman` is additive.

## Project Overrides (`./.parishad.yaml`)

A project can pin parishad defaults by placing a `.parishad.yaml` in its root. Recognized keys (all optional): `triad`, `members`, `chairman`. Precedence, highest first:

1. Explicit CLI flags on the `/parishad` invocation
2. `./.parishad.yaml` in the current working directory
3. Built-in defaults (auto-triad selection)

Example:

```yaml
# .parishad.yaml — this repo always convenes the ethics triad with Vidura in the chair
triad: ethics
chairman: vidura
```

The coordinator checks for this file once, at the start of STEP 0, and states in the `[CHECKPOINT]` when project overrides were applied.

## Asset Resolution

This skill is distributed two ways, so parishad assets live in one of two roots. Resolve each asset by trying these locations in order and use the first that exists:

1. **install.sh layout**: agents at `~/.claude/agents/parishad-{name}.md`, skill at `~/.claude/skills/parishad/SKILL.md`
2. **Plugin layout** (marketplace install): agents at `${CLAUDE_PLUGIN_ROOT}/agents/parishad-{name}.md`, skill at `${CLAUDE_PLUGIN_ROOT}/skills/parishad/SKILL.md`. Plugin-provided agents are also directly addressable as namespaced subagents (`parishad:parishad-{name}`).

Every later reference to a `~/.claude/...` parishad path means "the resolved asset root" — substitute the plugin paths when running from a marketplace install.

---

## The 7 Council Members

| Agent | Guru | Domain | Model | Polarity |
|-------|------|--------|-------|----------|
| `parishad-chanakya` | Chanakya (Kautilya) | Statecraft, power & incentives | sonnet | Secure the outcome |
| `parishad-shankara` | Adi Shankaracharya | Non-dual dialectic (neti-neti) | opus | Real vs apparent |
| `parishad-patanjali` | Patanjali | Disciplined method & mind-mastery | sonnet | Still the mind first |
| `parishad-nagarjuna` | Nagarjuna | Emptiness & interdependence | opus | No position stands alone |
| `parishad-vidura` | Vidura | Dharma, ethics & counsel | opus | Duty and foresight |
| `parishad-ramakrishna` | Ramakrishna Paramhansa | Direct experience; harmony of paths | opus | Experience over theory |
| `parishad-vivekananda` | Swami Vivekananda | Practical Vedanta — action & service | sonnet | Turn the ideal into action |

## Polarity Pairs

- **Chanakya ⇄ Vidura** — ends & leverage vs duty & dharma
- **Chanakya ⇄ Shankara** — engage/acquire the world vs discriminate it as apparent
- **Chanakya ⇄ Nagarjuna** — decisive commitment vs no fixed position
- **Nagarjuna ⇄ Shankara** — emptiness (no self-nature) vs the one real non-dual Self
- **Patanjali ⇄ Shankara** — gradual disciplined practice vs sudden liberating knowledge
- **Patanjali ⇄ Vivekananda** — staged inner discipline vs act-now boldness
- **Ramakrishna ⇄ Vivekananda** — contemplative realization vs engaged service (guru & disciple)
- **Ramakrishna ⇄ Chanakya** — pure devotion vs cold power
- **Vivekananda ⇄ Nagarjuna** — manifest the ideal through action vs nothing to grasp
- **Vidura ⇄ Vivekananda** — cautious foresight vs fearless action

## Pre-defined Triads

| Domain | Triad | Rationale |
|--------|-------|-----------|
| `strategy` | Chanakya + Nagarjuna + Vidura | leverage + interdependence of forces + ethical foresight |
| `ethics` | Vidura + Shankara + Ramakrishna | dharma + discrimination of real value + harmony of paths |
| `architecture` / `systems` | Nagarjuna + Chanakya + Patanjali | interdependence + structural leverage + disciplined method |
| `debugging` | Shankara + Nagarjuna + Patanjali | strip false premises + dependent origination + methodical introspection |
| `decision` | Patanjali + Vidura + Chanakya | debias the mind + dharmic foresight + incentive realism |
| `bias` | Patanjali + Shankara + Vidura | mind's distortions + false superimposition + honest counsel |
| `risk` / `uncertainty` | Chanakya + Nagarjuna + Vidura | contingency + emptiness-of-certainty + prudent duty |
| `conflict` | Vidura + Chanakya + Shankara | dharma + realpolitik + reframe the dispute |
| `product` / `shipping` / `execution` | Vivekananda + Chanakya + Patanjali | fearless action + incentives + disciplined execution |
| `meaning` / `purpose` | Shankara + Ramakrishna + Nagarjuna | non-dual + direct experience + emptiness |
| `innovation` / `complexity` | Nagarjuna + Shankara + Chanakya | interdependence + reframe + strategic leverage |
| `leadership` / `service` | Vivekananda + Vidura + Ramakrishna | strength + duty + devotion |

## Duo Polarity Pairs (for `--duo` mode)

| Domain keywords | Pair | Tension |
|-----------------|------|---------|
| philosophy, meaning, reality, purpose | Nagarjuna vs Shankara | emptiness vs the one real Self |
| method, discipline, practice, process | Patanjali vs Shankara | gradual practice vs sudden knowledge |
| strategy, power, competition | Chanakya vs Vidura | realpolitik vs dharma |
| worldly, wealth, engagement, renunciation | Chanakya vs Shankara | acquire the world vs see it as apparent |
| action, service, contemplation | Ramakrishna vs Vivekananda | realization vs engaged service |
| decision, commitment, certainty | Chanakya vs Nagarjuna | decisive commitment vs no fixed position |
| goal, achievement, effort | Vivekananda vs Nagarjuna | manifest the ideal vs nothing to grasp |
| default (no keyword match) | Chanakya vs Vidura | pragmatism vs principle |

---

## Coordinator Execution Sequence

Follow these steps in order. Do NOT skip steps or merge rounds.

### STEP 0: Parse Mode and Select Panel

**Load project overrides first:** if `./.parishad.yaml` exists in the working directory, read it and treat its keys as default flag values (see Project Overrides above). Explicit CLI flags always win.

**Determine mode:**
- If `--quick` → QUICK MODE (skip to Quick Mode Sequence below)
- If `--duo` → DUO MODE (skip to Duo Mode Sequence below)
- Otherwise → FULL MODE (continue here)

**Select panel members:**
1. If `--full` → all 7 gurus
2. If `--triad [domain]` → look up triad from tables above
3. If `--members name1,name2,...` → use those members
4. If none of the above → **Auto-Triad Selection**: read the problem statement, match against triad domain keywords and rationales, select the best-fitting triad. State your selection and reasoning before proceeding.

**Designate the domain-weight seat (do this NOW, before any analysis).** Identify the single member whose domain most directly matches the problem — this member receives a **1.5× weight** at tie-breaking (STEP 6). Lock it here, at panel selection, *before* any positions exist. Selecting the heavyweight after seeing votes would let the coordinator nudge the outcome; selecting it up front keeps tie-breaking honest. If two members are equally on-domain, pick neither — record "no domain-weight seat (ambiguous match)" and tie-break on equal weights.

**Method diversity (DMAD, arXiv:2410.12853).** Every member carries a distinct `reasoning_method` in its frontmatter `parishad:` block — an explicit reasoning method, not just a persona. When substituting or swapping members (`--members` overrides, seat changes), the coordinator must preserve method diversity: never assemble a panel where two seats share the same `reasoning_method`.

`[CHECKPOINT]` State the selected members, mode, and the designated domain-weight seat (member + 1.5× + one-line rationale, or "none — ambiguous match") before proceeding.

### STEP 1: Dispatch model

Every seat runs as a Claude Code subagent. Spawn each guru with `subagent_type` matching its
agent name (`parishad-{name}`), using the guru's frontmatter `model` (opus/sonnet) unless the
user overrode it. There is no external-provider routing in this plugin. Proceed to STEP 1.5.

### STEP 1.5: Problem Restate Gate

Before any analysis begins, each member must restate the problem. This catches wrong-question failures before burning rounds on them.

Spawn each member in parallel with:
```
Read your agent definition at ~/.claude/agents/parishad-{name}.md.

The problem under deliberation:
{problem}

Before you begin analysis, restate this problem in TWO parts:
1. **Your restatement**: One sentence capturing the core question through your analytical lens.
2. **Alternative framing**: One sentence reframing the problem in a way the original statement may have missed.

Do NOT begin your analysis yet. Just the restatement and alternative framing. 50 words maximum total.
```

`[CHECKPOINT]` Review all restatements. If any member's restatement diverges significantly from the original problem, flag this to the user — it may reveal a framing issue worth addressing before deliberation. Include the restatements in the Round 1 prompt so members see each other's framings.

### STEP 1.7: Chairman Selection — the Sutradhaar

The Chairman is the **Sutradhaar** (सूत्रधार, "holder of the thread") — a named, non-deliberating
synthesizer, not one of the 7 gurus. The Sutradhaar does NOT participate in Rounds 1–3; it emits
the final verdict in STEP 7 only, running as a Claude subagent (opus).

Selection: if `--chairman <guru>` was passed, that guru synthesizes and sits out deliberation
(the panel drops to the remaining members). Otherwise the Sutradhaar chairs and all convened members
deliberate. Record the choice in the verdict metadata.

`[CHECKPOINT]` State the selected Chairman: the Sutradhaar (default), or the named `--chairman` guru and the members that remain deliberating.

### STEP 2: Round 1 — Independent Analysis (PARALLEL, BLIND-FIRST)

Emit to user:
> **Parishad convened**: {guru names}. Beginning Round 1 — independent analysis.

Run all gurus **IN PARALLEL**. Each guru sees ONLY the problem statement (blind-first, no peer outputs).

**Dispatch** — spawn each guru as a Claude Code subagent:
- Use `subagent_type` matching the guru's agent name (`parishad-{name}`; agents resolve per Asset Resolution above).
- Use the guru's frontmatter `model` (opus/sonnet) unless the user overrode it.

**Prompt template:**
```
You are operating as a member of the Guru Parishad in a structured deliberation.
Read your agent definition at ~/.claude/agents/parishad-{name}.md and follow it precisely.

The problem under deliberation:
{problem}

Here is how each guru reframed the problem:
{all restatements from Step 1.5}

Reason via your designated method: {reasoning_method from your frontmatter}. Do not imitate other members' methods — method diversity is the point (DMAD, arXiv:2410.12853).
Produce your independent analysis using your Output Format (Standalone).
Do NOT try to anticipate what other members will say.
Limit: 400 words maximum.
```

**Note**: The same subagent dispatch applies to all subsequent rounds (Steps 3 and 5).

`[CHECKPOINT]` Confirm all Round 1 outputs collected. Verify each is ≤400 words and follows the guru's Output Format.

### STEP 3: Round 2 — Cross-Examination (ANONYMIZED)

Emit to user:
> **Round 1 complete** ({N} analyses collected). Beginning Round 2 — cross-examination (anonymized).

**Identity anonymization** (evidence-based — see Choi et al., arXiv:2510.07517, ICLR 2026; Karpathy `llm-council`). Round 2 is conducted with member identities masked to prevent conformity bias from social signal. Before sending Round 2 prompts:

1. Build a stable label mapping for this session: `Member A` → first member, `Member B` → second, …, in the order they appear in the panel. The labels are stable across the entire Round 2 (and any Batch B follow-ups) so members can reference each other consistently within the round.
2. Rewrite each Round 1 output's header from `{name}` (or the member's self-attribution line) to its assigned label. Strip any in-body self-references that would re-disclose identity (e.g., "As Chanakya, I…" → "As Member B, I…"). Keep all other content unchanged.
3. Retain the mapping privately in the coordinator's working state. **Do NOT** expose it to deliberating members during Round 2. The mapping is restored for Round 3 (Final Crystallization), tie-breaking, and the verdict transcript.

**Execution strategy:**
- If panel size ≤ 4: run fully **SEQUENTIAL** (each member sees all prior Round 2 responses, still with anonymized labels)
- If panel size ≥ 5: run all members in **PARALLEL** (each sees all anonymized Round 1 outputs). For panels of 7, optionally use **Batch A** (parallel) + **Batch B** (sequential, sees Batch A outputs with the same labels) if cross-contamination would meaningfully improve quality.

Prompt template for each member (the **Anti-conformity directive** below is evidence-based — see Choi et al., arXiv:2510.07517; Cui et al., Free-MAD arXiv:2509.11035; controlled-study arXiv:2511.07784):
```
You are parishad-{name} in Round 2 of a structured deliberation.
Read your agent definition at ~/.claude/agents/parishad-{name}.md.

**Identity is masked in this round.** The Round 1 analyses below are labeled
Member A, Member B, … — you do not know which colleague produced which. One
of them is your own Round 1 output (anonymized along with the rest). Evaluate
by argument quality, not by source. Do not try to guess identities and do not
reference any guru by their real name in this round; use the labels.

Here are the (anonymized) Round 1 analyses from all gurus:

{anonymized Round 1 outputs, headed by Member A/B/C/…}

{If Batch B: "Here are Round 2 responses from earlier members (same labels):\n{Batch A Round 2 outputs}"}

**Anti-conformity directive.** If your Round 1 position was correct, defend it.
Do not update merely because peers disagree, because consensus is forming, or
because a position is repeated by multiple members. Update only when presented
with sound, validity-aligned reasoning that exposes a specific flaw in your
earlier argument. Naming that flaw is required when you update; if you cannot
name it, you should not update.

Now respond using your Output Format (Council Round 2):
1. Which member's position do you most disagree with, and why? Engage their specific claims. Refer to them as "Member X".
2. Which member's insight strengthens your position? How? Refer to them as "Member Y".
3. Restate your position in light of this exchange, noting any changes.
4. Label your key claims: empirical | mechanistic | strategic | ethical | heuristic

Limit: 300 words maximum. You MUST engage at least 2 other members by label.
```

`[CHECKPOINT]` Confirm all Round 2 outputs collected. Before proceeding to STEP 4, the coordinator restores the label → real-name mapping in its working state. The Round 2 transcript is kept in BOTH forms: anonymized (what members saw) and de-anonymized (for STEP 7 audit).

### STEP 4: Post-Round Enforcement Scan

Run all enforcement checks on Round 2 outputs in a single pass:

**`[VERIFY]` Dissent quota**: At least 2 members must articulate a non-overlapping objection. If fewer than 2 → send the dissent prompt:
```
Your Round 2 response agreed with the emerging consensus. The parishad requires dissent for quality.
State your strongest objection to the majority position in 150 words. What are they getting wrong?
```

**`[VERIFY]` Novelty gate**: Each response must contain at least 1 new claim, test, risk, or reframing not in that member's Round 1 output. If missing → send back:
```
Your Round 2 response restated your Round 1 position without engaging the challenges raised.
Address {specific member}'s challenge to your position directly. What changes?
```

**`[VERIFY]` Agreement check**: If >70% agree on core position → trigger counterfactual prompt to 2 most likely dissenters:
```
Assume the current consensus is wrong. What is the strongest alternative and what evidence would flip the decision?
```

**`[VERIFY]` Evidence labels**: Confirm claims are tagged (`empirical | mechanistic | strategic | ethical | heuristic`). Note reasoning monoculture (>80% same type).

**`[VERIFY]` Anti-recursion**: Any member who re-asks an already-answered question → force a 50-word position. Any member restates Round 1 without engaging challenges → send back. Exchange exceeds 2 messages between any pair → cut off.

### STEP 5: Round 3 — Final Crystallization (PARALLEL)

Emit to user:
> **Cross-examination complete**. Round 3 — final positions.

Send each member their final prompt (run in parallel):
```
Final round. State your position declaratively in 100 words or less.
If your lens is interrogative or negational (e.g. neti-neti, tetralemma): you get exactly ONE question. Make it count. Then state your position.
No new arguments — only crystallization of your stance.

Then, on the LAST line, emit your structured stance EXACTLY in this format
so the parishad can tally it:
STANCE: <one short option label> | CONFIDENCE: high|med|low | DEALBREAKER: yes|no

- STANCE must be a terse label for the option you back (e.g. "monorepo",
  "ship now", "do not ship"). Use the SAME wording as peers where you agree —
  matching labels are what make the tally countable. If you genuinely back no
  option, write STANCE: abstain.
- DEALBREAKER: yes means you consider the opposing option actively harmful, not
  merely sub-optimal — surfaced in the Minority Report even if you're outvoted.
```

`[CHECKPOINT]` Collect every member's `STANCE:` line. Normalize labels that mean the same thing to a single canonical option (e.g. "monorepo" / "single repo" → `monorepo`). If a member omitted the line or it's unparseable, re-prompt that one member for the stance line only — do not infer their stance from prose.

`[CHECKPOINT]` Confirm all Round 3 outputs collected.

### STEP 6: Tie-Breaking

Tie-breaking operates on the **structured `STANCE:` lines** collected in STEP 5 — a counted tally, not a prose impression. Run the steps in order:

1. **Tally confidence-weighted votes per canonical option** (evidence-based — confidence-weighted aggregation beats uniform voting: Roundtable Policy arXiv:2509.16839; ConfMAD arXiv:2509.14034). Each member's **base weight** is **1.0**, except the domain-weight seat designated in STEP 0, which is **1.5**. Each member's **vote weight** is their base weight × a confidence factor from their `CONFIDENCE:` field: `high → 1.0`, `med → 0.75`, `low → 0.5`. `abstain` stances contribute to no option but still count toward total weight at full base weight (they raise the consensus bar — abstention is not a free pass). Compute:
   - `W_total` = sum of all members' **base** weights (e.g. a 3-member triad with one 1.5× seat → `1.5 + 1.0 + 1.0 = 3.5`). Base weights — not confidence-discounted — so a low-confidence panel cannot manufacture consensus by shrinking the denominator; hesitant panels escalate to the user instead of forcing a verdict.
   - `W_option` = summed **vote** weight of members backing each option.
2. **Consensus test.** An option reaches consensus iff `W_option ≥ (2/3) × W_total`. (For the 3.5-weight triad: threshold = `2.333`, so the option needs the 1.5× seat **plus** one 1.0 seat at high confidence, or all three backers with enough confidence.) The highest-weight option that clears the bar is the verdict.
   - On consensus → record the surviving option. Any `DEALBREAKER: yes` dissent goes in the **Minority Report** even when outvoted.
3. **No option clears 2/3 → genuine split.** Do NOT force consensus, do NOT run another round (the round budget is spent — that bound is the forcing function). Present the dilemma to the user with each option, its weighted tally, and the strongest argument for each. The verdict's Consensus section reads "No consensus reached" and the split is handed to the user to decide.
4. **Exact tie between two options** (equal weight, both below 2/3): report both as a live split — the domain-weight seat has already been applied, so there is no further mechanical breaker by design. Surfacing the unresolved tension honestly beats inventing a winner.

**Always record the tally** (`option → weight`, which seat carried 1.5×, and each backer's confidence factor) in the verdict's Vote Tally field, so the decision is auditable without re-reading the transcript.

### STEP 7: Synthesize Verdict (SUTRADHAAR)

Synthesis is performed by the **Sutradhaar (or the `--chairman` guru) selected in STEP 1.7**, not by the coordinator. Dispatch the synthesis as a single Claude subagent call (opus) using the prompt template below.

**Sutradhaar prompt template:**
```
You are the Sutradhaar of the Guru Parishad — the holder of the thread. You did not
deliberate in this session; you weave the gurus' strands into one verdict.

The original problem under deliberation:
{problem}

The full deliberation transcript follows. Member names are now visible
(Round 2 was anonymized for the members but the audit transcript restores
real names for synthesis).

Round 1 — Independent Analysis:
{Round 1 outputs, named}

Round 2 — Cross-Examination:
{Round 2 outputs, with names restored from the anonymization mapping}

Round 3 — Final Crystallization:
{Round 3 outputs, named}

Your job:
- Weigh arguments by validity, not by repetition or seniority.
- Surface genuine disagreement; do not invent positions no member held.
- Lead with what the parishad does NOT know (Unresolved Questions).
- Produce the Parishad Verdict using the template that follows. Do not
  add, remove, or rename sections. Fill each section faithfully or write
  "N/A — {reason}" if the section is genuinely empty in this session.

{Insert the "Parishad Verdict (Full Mode)" template from the Output Templates section}
```

Pass the rendered prompt to the Sutradhaar (Claude opus subagent). Capture the output as the verdict. The coordinator then surfaces the verdict to the user verbatim — no post-processing, no re-synthesis.

**Fallback**: If the Sutradhaar synthesis call fails, the coordinator produces the verdict directly and annotates the verdict metadata: `Chairman: Sutradhaar (FAILED — synthesized by coordinator fallback)`.

### STEP 8: Append Session Metadata

After the verdict is rendered, the coordinator appends a `Session Metadata` block at the end. Best-effort — fill every field that's knowable from coordinator state; write `~unknown` for any field the host runtime doesn't expose. The block uses a fixed `schema_version: 1` so future log aggregation can rely on the shape.

Required fields:
- `schema_version: 1`
- `mode`: full | quick | duo
- `panel_size`: integer
- `rounds_run`: integer (actual, not target — count any rounds that were truncated)
- `chairman_failed_fallback`: yes | no
- `tools_used`: yes if any subagent invoked Read/Grep/Glob/Bash/WebSearch/WebFetch; no otherwise

Best-effort fields (write `~unknown` if not available):
- `input_tokens_estimate`, `output_tokens_estimate` (host-runtime dependent)
- `duration_seconds`

This block is intentionally not a sub-section of the verdict — it's session telemetry appended below a separator. Reasoning: keeps it cheap to grep, future-easy to redirect to a log file, and avoids polluting the auditable decision artifact with infra noise.

---

## Quick Mode Sequence (`--quick`)

Fast 2-round deliberation for simpler questions. No cross-examination.

### QUICK STEP 0: Select Panel

Same panel selection as full mode Step 0. If no panel specified, default to best-matching triad via auto-selection.

**Chairman**: Chairman = the **Sutradhaar** (non-deliberating, Claude opus) by default. If `--chairman <guru>` was passed, that guru synthesizes the verdict and **sits out deliberation** — remove it from the panel before Round 1 (if that leaves fewer than 2 deliberating members, keep the guru on the panel and note the chairman shares the panel).

`[CHECKPOINT]` State selected members.

### QUICK STEP 0.5: Problem Restate Gate

Each member restates the problem before analysis. In quick mode, this is embedded in the Round 1 prompt (not a separate step) to save time.

### QUICK STEP 1: Round 1 — Rapid Analysis (PARALLEL)

Emit to user:
> **Quick parishad convened**: {guru names}. Rapid analysis.

Spawn all members in parallel with:
```
You are operating as a member of the Guru Parishad in a rapid deliberation.
Read your agent definition at ~/.claude/agents/parishad-{name}.md and follow it precisely.

The problem under deliberation:
{problem}

First, in ONE sentence, restate this problem through your analytical lens. Then produce a condensed analysis:
- Essential Question (1-2 sentences)
- Your core analysis (key insight only)
- Verdict (direct recommendation)
- Confidence (High/Medium/Low)

Limit: 200 words maximum. Be decisive.
```

`[CHECKPOINT]` Confirm all outputs collected.

### QUICK STEP 2: Round 2 — Final Positions (PARALLEL, ANONYMIZED)

Emit to user:
> **Round 1 complete**. Final positions (anonymized).

Anonymize peer Round 1 outputs the same way as STEP 3 of full mode: assign stable labels `Member A`, `Member B`, …, strip self-attribution, retain the mapping in coordinator state. Quick mode is more conformity-prone than full mode (only one cross-look), so anonymization here is non-optional.

Send each member:
```
Here are the (anonymized) Round 1 analyses from the other members:
{anonymized Round 1 outputs, headed by Member A/B/C/…}

**Identity is masked.** Evaluate by argument quality, not by source. Refer to
peers as "Member X" — do not use real guru names in this round.

**Anti-conformity directive.** If your Round 1 position was correct, defend it.
Do not update merely because peers disagree or because consensus is forming.
Update only when presented with sound reasoning that exposes a specific flaw
in your earlier argument; if you cannot name the flaw, do not update.

State your final position in 75 words or less. Note any key disagreement
(call out the specific Member whose position you push back on). Be direct.

Then, on the LAST line, emit your structured stance EXACTLY in this format:
STANCE: <one short option label> | CONFIDENCE: high|med|low | DEALBREAKER: yes|no
Use the SAME label as peers where you agree; write STANCE: abstain if you back
no option.
```

`[CHECKPOINT]` Collect every `STANCE:` line and apply the STEP 6 weighted tally (the STEP 0 domain-weight seat carries 1.5× in quick mode too). Re-prompt any member who omitted the line rather than inferring from prose.

### QUICK STEP 3: Synthesize Quick Verdict (SUTRADHAAR)

Dispatch synthesis to the Sutradhaar (or the `--chairman` guru selected in QUICK STEP 0). Use the Quick Verdict template below. Same fallback rule as STEP 7.

---

## Duo Mode Sequence (`--duo`)

Two-member dialectic for rapid opposing perspectives.

### DUO STEP 0: Select Pair

1. If `--members name1,name2` → use those two members
2. Otherwise → match problem against Duo Polarity Pairs table above, select the best-fitting pair
3. State the selected pair and the tension they represent

**Chairman**: Chairman = the **Sutradhaar** by default. `--chairman` in duo mode MUST name a guru who is NOT one of the two duo members (the chairman audits, not participates); if `--chairman` names a duo member, ignore it and use the Sutradhaar.

`[CHECKPOINT]` State selected pair and tension.

### DUO STEP 0.5: Problem Restate Gate

Each member restates the problem before analysis. In duo mode, this is embedded in the Round 1 prompt.

### DUO STEP 1: Round 1 — Opening Positions (PARALLEL)

Emit to user:
> **Duo convened**: {member A} vs {member B} — {tension description}.

Spawn both members in parallel:
```
You are operating as one half of a structured dialectic with one opponent.
Read your agent definition at ~/.claude/agents/parishad-{name}.md and follow it precisely.

The problem under deliberation:
{problem}

First, in ONE sentence, restate this problem through your analytical lens. Then state your position using your Output Format (Standalone).
Limit: 300 words maximum.
```

### DUO STEP 2: Round 2 — Direct Response (PARALLEL)

**Anonymization is not applied in duo mode.** With only two members and an explicitly named opponent, identity cannot be meaningfully masked (each side knows who the other is by elimination), and the dialectic depends on each member knowing their opponent's specific analytical lens. The conformity failure mode that motivates Round-2 anonymization in larger panels does not arise in a 2-member exchange.

Send each member the other's Round 1 output:
```
Your opponent ({other member name}) argued:

{other member's Round 1 output}

**Anti-conformity directive.** If your Round 1 position was correct, defend it.
Concede only what is specifically and validly disproved — not what merely sounds
forceful. Name the flaw in your earlier argument when conceding; if you cannot
name it, the concession is not warranted.

Respond directly:
1. Where are they wrong? Engage their specific claims.
2. Where are they right? Concede what deserves conceding.
3. Restate your position, strengthened by this exchange.

Limit: 200 words maximum.
```

### DUO STEP 3: Round 3 — Final Statements (PARALLEL)

```
Final statement. 50 words maximum. State your position. No new arguments.
```

### DUO STEP 4: Synthesize Duo Verdict (SUTRADHAAR)

Dispatch synthesis to the Sutradhaar (or the `--chairman` guru selected in DUO STEP 0). The Chairman must NOT be either of the two duo members (hard constraint — the Chairman audits, not participates; the Sutradhaar already satisfies this since it is none of the 7 gurus). Use the Duo Verdict template below. Same fallback rule as STEP 7.

---

## Output Templates

### Parishad Verdict (Full Mode)

```markdown
## Parishad Verdict

### Problem
{Original problem statement}

### Parishad Composition
{Gurus convened, mode used, and selection rationale}

### Chairman
{Chairman: <name>. Default is the Sutradhaar (Claude opus, non-deliberating). If `--chairman <guru>` was used, name that guru and note that they sat out deliberation.}

### Dispatch
Dispatch: Claude subagents (single provider).

### Acceptable Compromises
{What this verdict gives up, named explicitly. One bullet per compromise; ≤2 sentences each. If "nothing is being given up," say so and explain why — most non-trivial decisions trade something.}

### Kill Criteria
{The specific observable conditions that would falsify this verdict. Each criterion must be (a) observable without re-convening the parishad, (b) tied to a measurable threshold or event, and (c) achievable within a stated time window. Format: "If <X> observed by <date>, the verdict is invalidated and we should <Y>."}

### Concrete Next Step
{Exactly one action. Named, doable, owned. Format: "<verb> <object> by <date>." Not "consider," not "explore" — verbs that produce an artifact (write, push, merge, run, file, measure).}

### Unresolved Questions
{Questions the parishad could not answer — inputs needed from user. Lead with what the parishad does NOT know.}

### Recommended Next Steps
{Additional concrete actions beyond the single Concrete Next Step above, ordered by priority. If the Concrete Next Step is sufficient, write "N/A — see Concrete Next Step."}

### Consensus & Agreement
{The position that survived deliberation and what members converged on — or "No consensus reached" with explanation}

### Vote Tally
{The STEP 6 confidence-weighted tally. One line per option: `<option> — <weight> (<backers with confidence>)`. Mark the 1.5× domain-weight seat. State the threshold and whether it was cleared. Example:
- `ship now — 2.25 (Chanakya [1.5× domain, high], Vivekananda [med → 0.75])` — did not clear 2.333 threshold
- `wait — 1.0 (Vidura [high])`
- W_total 3.5 · threshold 2.333 · **no option carries → escalated to user**
If no seat carried 1.5× (ambiguous match), say so. If split, show both options and "no option cleared threshold → escalated to user".}

### Key Insights by Member
- **{Name}**: {Their most valuable contribution in 1-2 sentences}
- ...

### Points of Disagreement
{Where positions remained irreconcilable}

### Minority Report
{Dissenting positions and their strongest arguments}

### Epistemic Diversity Scorecard
- Perspective spread (1-5): {how orthogonal the viewpoints were}
- Method-tier spread: {opus vs sonnet mix across the panel — single provider by design}
- Evidence mix: {% empirical / mechanistic / strategic / ethical / heuristic}
- Convergence risk: {Low/Medium/High with reason}

### Follow-Up
After acting on this verdict, revisit: Was this verdict useful? Was the recommended action taken? What happened? {This section is a prompt for the user, not filled by the parishad.}

---

### Session Metadata
```
schema_version: 1
mode: full | quick | duo
panel_size: <N>
rounds_run: <N>
chairman_failed_fallback: yes | no
tools_used: yes | no   # did members read files, grep, fetch URLs, etc.
input_tokens_estimate: ~<N>k    # best-effort if available from the host runtime
output_tokens_estimate: ~<N>k   # best-effort
duration_seconds: ~<N>
```
```

### Quick Verdict

```markdown
## Quick Parishad Verdict

### Problem
{Original problem statement}

### Panel
{Gurus and selection rationale}

### Chairman
{Chairman: <name>. Default is the Sutradhaar (Claude opus). If `--chairman <guru>`, name that guru.}

### Recommended Action
{Single concrete recommendation}

### Kill Criteria
{Observable conditions that would falsify this verdict. Required. Format: "If <X> observed by <date>, the verdict is invalidated and we should <Y>."}

### Concrete Next Step
{Exactly one action. Required. Format: "<verb> <object> by <date>." Artifact-producing verbs only — no "consider" or "explore".}

### Acceptable Compromises (optional)
{What this verdict gives up, named explicitly. Optional in quick mode — skip if genuinely trivial.}

### Positions
- **{Name}**: {Core position in 1-2 sentences}
- ...

### Consensus
{Majority position or "Split" with explanation}

### Vote Tally
{Confidence-weighted STEP 6 tally: one line per option `<option> — <weight> (<backers with confidence>)`, mark the 1.5× domain-weight seat, state threshold and whether cleared. If split: "no option cleared 2/3 → escalated to user".}

### Key Disagreement
{The most important point of divergence}

### Follow-Up
After acting on this verdict, revisit: Was this useful? What happened?

---

### Session Metadata
```
schema_version: 1
mode: quick
panel_size: <N>
rounds_run: 2
tools_used: yes | no
input_tokens_estimate: ~<N>k
output_tokens_estimate: ~<N>k
duration_seconds: ~<N>
```
```

### Duo Verdict

```markdown
## Duo Verdict

### Problem
{Original problem statement}

### The Dialectic
**{Member A}** ({their lens}) vs **{Member B}** ({their lens})

### Chairman
{Chairman: the Sutradhaar (Claude opus), or the `--chairman` guru. Must not be either duo member.}

### What This Means for Your Decision
{How to use these opposing perspectives — the user decides}

### {Member A}'s Position
{Core argument in 2-3 sentences}

### {Member B}'s Position
{Core argument in 2-3 sentences}

### Where They Agree
{Unexpected convergence, if any}

### The Core Tension
{The irreducible disagreement and what drives it}

### Concrete Next Step
{Exactly one action — the decision a reader can take after weighing both sides. Required even in duo mode. Format: "<verb> <object> by <date>."}

### Kill Criteria (encouraged)
{Observable conditions that would tip the balance toward the other side after acting on the Concrete Next Step. Encouraged but not required in duo mode — duo is dialectic, not decision-issuing.}

### Follow-Up
After deciding, revisit: Which perspective proved more useful? What happened?

---

### Session Metadata
```
schema_version: 1
mode: duo
panel_size: 2
rounds_run: 3
tools_used: yes | no
input_tokens_estimate: ~<N>k
output_tokens_estimate: ~<N>k
duration_seconds: ~<N>
```
```

---

## Example Usage

**Full mode:**
`/parishad --triad strategy Should we open-source our agent framework?`
→ Convenes Chanakya + Nagarjuna + Vidura, runs 3-round deliberation, produces a Parishad Verdict.

**Quick mode:**
`/parishad --quick Should we add Redis caching to the auth flow?`
→ Auto-selects the architecture triad, runs 2-round rapid analysis, produces a Quick Verdict.

**Duo mode:**
`/parishad --duo Should we rewrite the monolith as microservices?`
→ Selects Nagarjuna vs Shankara (philosophy/meaning domain), runs 3-round dialectic, produces a Duo Verdict.

**Auto-triad:**
`/parishad What's the best pricing model for our API?`
→ Coordinator analyzes the problem, selects the `product` triad (Vivekananda + Chanakya + Patanjali), runs full deliberation.

**Named chairman:**
`/parishad --chairman vidura Should we take the buyout offer?`
→ Vidura synthesizes as Chairman (sits out deliberation); the remaining gurus deliberate, then Vidura issues the verdict.
