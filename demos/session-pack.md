# Guru Parishad — Session Pack

A set of example `/parishad` invocations across every mode, with a one-line note on
which triad/pair auto-selects (or is forced) and why. Cross-checked against the
triad, duo-pair, and flag tables in `skills/parishad/SKILL.md`.

---

### 1. Auto-triad, full run (no flags)

```
/parishad Should we move from a single Postgres instance to a sharded multi-tenant setup before our next funding round?
```

No panel flag given, so the coordinator runs Auto-Triad Selection. The problem
statement is architecture/systems-shaped ("sharded", "instance", "setup"), so it
matches the `architecture` / `systems` triad: **Nagarjuna + Chanakya + Patanjali**
(interdependence of the data model + structural leverage of the sharding
decision + disciplined migration method). Runs the full 3-round sequence and
ends in a Parishad Verdict.

---

### 2. `--full`

```
/parishad --full What is the right pricing strategy for our SaaS product?
```

`--full` forces all 7 gurus onto the panel regardless of the problem's domain —
no triad lookup happens. Useful when the decision cuts across statecraft,
ethics, method, and action all at once (pricing touches incentives, fairness,
and go-to-market execution), and a 3-seat triad would leave out a load-bearing
perspective.

---

### 3. `--triad ethics`

```
/parishad --triad ethics Should we disclose the data-retention bug to customers before we've finished the fix?
```

`--triad ethics` names the triad explicitly, skipping auto-selection. Per
SKILL.md's Pre-defined Triads table this convenes **Vidura + Shankara +
Ramakrishna** — dharma and honest counsel (Vidura), discrimination of what's
real vs. face-saving optics (Shankara), and harmony-of-paths pragmatism about
how to actually communicate it (Ramakrishna).

---

### 4. `--members chanakya,vidura`

```
/parishad --members chanakya,vidura Is this layoff the right call given our runway?
```

Manual 2-member panel — bypasses both auto-selection and the pre-defined
triad tables entirely (the `--members` flag takes precedence per STEP 0's
panel-selection order). Pairs Chanakya's incentive/power-realism lens against
Vidura's dharma-and-foresight lens on a decision where "what's leveraged" and
"what's owed to people" pull in different directions.

---

### 5. `--quick`

```
/parishad --quick Should we add Redis caching to the auth flow?
```

`--quick` sets QUICK MODE (2-round, no cross-examination) and, since no panel
flag is given, falls back to Auto-Triad Selection same as full mode. This is
the SKILL.md worked example: the problem is systems-shaped, so it auto-selects
the `architecture` triad — **Nagarjuna + Chanakya + Patanjali** — and produces
a Quick Verdict instead of a full Parishad Verdict.

---

### 6. `--duo` (auto-paired)

```
/parishad --duo Should we abstract this shared-logic module into a reusable library, or does the duplication problem even really exist yet?
```

`--duo` sets DUO MODE. No `--members` given, so the coordinator matches the
problem against the Duo Polarity Pairs table. "Does the problem even exist" /
"should we abstract this" is a reality-vs-appearance question, which matches
the `philosophy, meaning, reality, purpose` keyword row → **Nagarjuna vs
Shankara** (emptiness / no fixed essence to the abstraction vs. discriminating
what in the duplication is real cost and what is merely apparent noise).

---

### 7. `--chairman vidura` override

```
/parishad --chairman vidura What is the right pricing strategy for our product?
```

`--chairman vidura` is additive per the flag-priority rule (it doesn't set
mode or panel, it overrides who synthesizes). No other panel flag is given, so
the coordinator still auto-selects a panel by Auto-Triad Selection — pricing
matches the `product` / `shipping` / `execution` triad, **Vivekananda +
Chanakya + Patanjali** — but instead of the default Sutradhaar, **Vidura**
chairs the synthesis and sits out deliberation himself, so the deliberating
panel is exactly those three (Vidura is not one of them here, so no seat is
dropped).

---

### 8. `--duo --members` explicit pairing

```
/parishad --duo --members chanakya,shankara Is this acquisition worth it, or are we just chasing a story we're telling ourselves?
```

`--duo` sets DUO MODE; `--members chanakya,shankara` explicitly names the pair
instead of letting the coordinator match Duo Polarity Pairs keywords. This is
still a real pair from SKILL.md's table (`worldly, wealth, engagement,
renunciation` → Chanakya vs Shankara — acquire the world vs. see it as
apparent), just selected manually because the caller already knows which
tension they want surfaced.
