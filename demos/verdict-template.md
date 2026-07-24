# Guru Parishad — Sample Verdict (Full Mode)

This is a worked example of a **Parishad Verdict** in Full mode, produced for the
sample problem "Should we rewrite the billing service as microservices?" Every
section below matches the Full-mode verdict template in
`skills/parishad/SKILL.md` (Output Templates → Parishad Verdict (Full Mode)),
in the same order, with no sections added, removed, or renamed. It exists to
document the expected shape of a real verdict — including what the
confidence-weighted vote tally actually looks like once the STANCE lines are
tallied.

Session assumed: no `--full` / `--triad` / `--members` / `--chairman` flags —
this is what Auto-Triad Selection produces on an architecture-shaped question.

---

## Parishad Verdict

### Problem
Should we rewrite the billing service as microservices?

### Parishad Composition
Panel: **Nagarjuna + Chanakya + Patanjali** (3 gurus), Full mode, 3-round
deliberation. No panel flag was passed, so the coordinator ran Auto-Triad
Selection: the problem is architecture/systems-shaped ("rewrite," "billing
service," "microservices" — a decomposition-boundary question), matching the
`architecture` / `systems` triad rationale from SKILL.md — interdependence of
the current data model + structural leverage of the extraction boundary +
disciplined migration method.

**Domain-weight seat:** Nagarjuna (1.5×) — the decision is fundamentally about
untangling interdependence in the billing service's current coupling; no
other member's domain sits closer to the actual question being asked. Locked
at panel selection, before any position existed.

### Chairman
Chairman: the Sutradhaar (Claude opus, non-deliberating). No `--chairman` flag
was passed, so the default synthesizer was used; all three panel members
deliberated across all three rounds.

### Dispatch
Dispatch: Claude subagents (single provider).

### Acceptable Compromises
- We give up a clean, from-scratch rewrite in favor of incremental extraction
  — the monolith's billing module will coexist with the newly extracted
  service behind a shim for roughly 2–3 quarters, not a single cutover.
- We accept temporary duplication (a strangler-fig shim translating between
  the monolith's billing calls and the extracted service) in exchange for a
  smaller blast radius per change.
- We are explicitly not resolving the deeper data-model coupling between
  billing and subscriptions/entitlements in this pass — that untangling is
  named as deferred future work, not solved by this verdict.

### Kill Criteria
- If the strangler-fig shim adds more than 50ms p95 latency to checkout by
  4 weeks after the first extracted service reaches production, the verdict
  is invalidated and we should pause further extraction and redesign the shim.
- If 2 or more Sev2+ incidents are traced to the dual-write/shim layer within
  60 days of the first extraction, the verdict is invalidated and we should
  revert to monolith-only billing until root cause is fixed.
- If, 90 days in, no team has taken dedicated ownership of the extracted
  billing service (i.e., it's still being run by whoever has spare monolith
  on-call time), the verdict is invalidated — extraction without ownership
  just relocates the coupling instead of resolving it.

### Concrete Next Step
Extract the invoice-generation subroutine (the most decoupled, lowest-blast-
radius piece of the billing module) behind a strangler-fig shim and ship it
to 5% of production traffic by August 21, 2026.

### Unresolved Questions
- The parishad does not know the current on-call/ownership structure for
  billing — whether a team exists that can own an extracted service, or
  whether this creates orphaned infrastructure. Confirm before scheduling
  the Concrete Next Step.
- The parishad does not know the actual coupling depth between billing and
  the subscriptions/entitlements data model — Nagarjuna's Round 1 analysis
  flagged this as the load-bearing unknown, but no member had access to the
  schema to verify it.
- No member estimated the infra + on-call cost of running the shim layer
  during the multi-quarter coexistence window — needed before this verdict
  is defensible to whoever owns the budget.

### Recommended Next Steps
1. Run a dependency audit of the billing↔subscriptions coupling before the
   extraction ships — this determines whether invoice-generation really is
   the lowest-coupling starting point, per the first Unresolved Question.
2. Confirm a dedicated on-call owner for the extracted service *before* the
   5% rollout, not after — Patanjali's Round 2 objection was that
   "extraction without an owner is just distributed technical debt with a
   network hop."
3. Instrument the shim layer's latency and error rate from day one, so the
   Kill Criteria above are measurable rather than retrofitted after an
   incident.

### Consensus & Agreement
The panel converged on **extract-incrementally** (strangler-fig, starting
with the most decoupled subroutine) over **microservices-now** (fuller
decomposition upfront). Nagarjuna (1.5× domain seat) and Patanjali both
backed incremental extraction at high confidence; Chanakya dissented at
dealbreaker level, backing a faster, fuller decomposition (see Minority
Report), but was outvoted on the weighted tally.

### Vote Tally
- `extract-incrementally — 2.5 (Nagarjuna [1.5× domain, high], Patanjali [1.0, high])` — clears the 2.333 threshold (2/3 of W_total 3.5)
- `microservices-now — 0.75 (Chanakya [1.0 base → 0.75 at med confidence], DEALBREAKER: yes)`
- W_total = 1.5 (Nagarjuna) + 1.0 (Chanakya) + 1.0 (Patanjali) = 3.5 · threshold = 2.333 · **extract-incrementally carries**

Raw Round 3 stance lines, for audit:
> Nagarjuna: STANCE: extract-incrementally | CONFIDENCE: high | DEALBREAKER: no
> Patanjali: STANCE: extract-incrementally | CONFIDENCE: high | DEALBREAKER: no
> Chanakya: STANCE: microservices-now | CONFIDENCE: med | DEALBREAKER: yes

### Key Insights by Member
- **Nagarjuna**: The billing service isn't one thing with a clean edge — its
  "boundary" depends on which caller you look at. Extraction should follow
  discovered coupling, not an assumed target architecture; committing to full
  microservices upfront treats the current module map as more real than it is.
- **Chanakya**: A staged, multi-quarter extraction with a shim layer creates a
  long window where two systems can silently drift on billing correctness —
  the leverage move is to decompose faster and shrink that exposure window,
  even at the cost of a rougher cutover.
- **Patanjali**: Whatever boundary wins, the failure mode is the same:
  extraction without a disciplined, staged runbook and a dedicated owner just
  relocates the mess. Method matters as much as which architecture is chosen.

### Points of Disagreement
Chanakya's disagreement with Nagarjuna and Patanjali was about tempo, not
direction: his objection wasn't to extraction itself but to how slowly this
plan does it, arguing the shim-layer coexistence period is itself the
biggest risk. Nagarjuna and Patanjali held that the coexistence period is the
safer path precisely because it surfaces the coupling and ownership questions
nobody has answered yet. Both sides named the same failure mode (billing
correctness drift) but disagree on whether speed or staging reduces it —
unreconciled.

### Minority Report
Chanakya (`DEALBREAKER: yes`): "A multi-quarter shim-layer coexistence is not
caution, it's prolonged exposure. Every month billing logic exists in two
places is a month where the two can silently disagree on money — that's
worse than a harder, faster cutover with a real freeze window. If leadership
has the appetite for a 2-week billing freeze, take the faster path instead of
the incremental one this verdict recommends."

### Epistemic Diversity Scorecard
- Perspective spread (1-5): **4** — interdependence (Nagarjuna),
  incentive/leverage (Chanakya), and disciplined method (Patanjali) are
  genuinely orthogonal lenses; the only reason this isn't a 5 is that all
  three converged on "extract before rewrite" by Round 3, narrowing the
  spread on the core direction (only tempo stayed contested).
- Method-tier spread: 1 opus (Nagarjuna) / 2 sonnet (Chanakya, Patanjali) —
  single provider by design.
- Evidence mix: mechanistic 40% (Nagarjuna's coupling/interdependence
  analysis), strategic 35% (Chanakya's exposure-window/leverage argument),
  heuristic 25% (Patanjali's staged-method/runbook argument); 0% empirical —
  no member had access to real coupling data, which is exactly the gap named
  in Unresolved Questions.
- Convergence risk: **Low** — Chanakya's dissent is a genuine dealbreaker-
  level objection preserved in the Minority Report, not manufactured false
  consensus; the 2/3 threshold was cleared by the domain-weighted seat plus
  one full-confidence backer, not by confidence-inflation.

### Follow-Up
After acting on this verdict, revisit: Was this verdict useful? Was the
recommended action taken? What happened?

---

### Session Metadata
```
schema_version: 1
mode: full
panel_size: 3
rounds_run: 3
chairman_failed_fallback: no
tools_used: no
input_tokens_estimate: ~18k
output_tokens_estimate: ~6k
duration_seconds: ~420
```

---

## Scoring Rubric

A short rubric for grading any Parishad Verdict's deliberation quality,
mirroring the Epistemic Diversity Scorecard fields above. Use it to sanity-
check a verdict before trusting it.

| Dimension | 1 (weak) | 3 (adequate) | 5 (strong) |
|---|---|---|---|
| **Perspective spread** | All members effectively argue the same lens with different vocabulary; Round 3 stances all match with no real tension. | Two genuinely distinct lenses represented; some overlap in reasoning method. | Every seat's `reasoning_method` is visibly doing independent work — positions could only have come from that member's domain, and disagreement in Rounds 1–2 is about substance, not phrasing. |
| **Evidence mix** | One `empirical\|mechanistic\|strategic\|ethical\|heuristic` label accounts for >80% of tagged claims (reasoning monoculture, per STEP 4's Evidence-labels check). | 2–3 label types present, one still dominant. | Claims spread across 3+ label types with no single type over ~50%, and gaps (e.g. no empirical evidence) are explicitly named rather than silently absent. |
| **Convergence risk** | Consensus was reached with zero dissent, or a `DEALBREAKER: yes` vote was outvoted and not carried into the Minority Report. | Consensus reached; dissent recorded but thin (no named mechanism for the disagreement). | Consensus (or an honest non-consensus) reached without confidence-inflation; every `DEALBREAKER: yes` stance is preserved verbatim in the Minority Report with its specific mechanism, even when outvoted. |

Applied to the billing-service example above: perspective spread **4/5**
(three orthogonal domains, narrowed only on tempo by Round 3), evidence mix
**4/5** (three label types represented, empirical gap named rather than
hidden), convergence risk **Low** (dealbreaker dissent carried through to the
Minority Report intact, threshold cleared by domain-weight + one full-
confidence backer rather than confidence inflation).
