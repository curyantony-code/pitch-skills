# pitch-skills

Five Claude skills that coach a founder through an investor pitch, built from patterns in about 70 software, app and service pitches on Shark Tank, Dragons' Den and Y Combinator material.

They work in Claude desktop, claude.ai and Claude Code. Each skill is plain Markdown: no scripts, no network access, no dependencies.

## The skills

A pitch is judged on whatever the investor is really betting on. The skills split by that focus.

| Skill | Use it when the pitch rests on | It produces |
|---|---|---|
| `pitch-coach` | Not sure which, or you want to dissect someone else's pitch | A focus choice (primary and secondary), then routes into one of the four below. Dissect mode breaks a pasted pitch into beats, questions, objections and outcome |
| `pitch-founder-centric` | The person: track record, insight, hustle, little traction yet | Founder-proof checklist, 90-second script, weak-spot lines, ten-question drill |
| `pitch-service-centric` | A service delivered by people or providers: marketplaces, bookings, local operations | Unit-economics card, scale statement, 2-minute script, objection pre-empts, drill |
| `pitch-product-centric` | A working product: demo, paying users, pricing, defensibility | Metrics sheet, valuation line, script with demo moment, copy-risk answer, drill |
| `pitch-concept-centric` | A new behaviour or category with a prototype or pilot only | Wedge statement, why-now line, script with the objection answered first, valuation defence, drill |

Each focus skill ships its own `references/cases.md` (named pitches, what the investors said, what happened after) and a shared `references/question-bank.md` (the eight questions investors ask most, ranked, with what a strong answer contains).

## What they will not do

- **Invent your numbers.** Missing facts become `[to fill: ...]`, and the three most important gaps are listed at the top. Derived arithmetic (an implied valuation, a conversion rate) is allowed and labelled.
- **Promise funding.** In the sampled pitches, investors passed on strong pitches and funded weak ones, and on-air deals often did not close.
- **Pretend the evidence is stronger than it is.** The cases come from recap sites, Wikipedia and press, with no transcripts. Post-show figures are often self-reported, and the skills say "reported".

## Install

### Claude desktop or claude.ai

1. Download the zips from the [latest release](../../releases/latest), or build them (below).
2. Open Settings, then Capabilities, then Skills, and upload each zip. Menu names move between releases.
3. Start a chat with "I'm pitching my app on Shark Tank next month, help me get ready" and `pitch-coach` should take it from there.

### Claude Code

```bash
git clone https://github.com/curyantony-code/pitch-skills.git
cp -R pitch-skills/skills/pitch-* ~/.claude/skills/
```

### Build the zips yourself

```bash
./scripts/package.sh   # writes dist/<skill>.zip, one per skill, without the eval folders
```

The question bank is kept once in `shared/` and copied into each skill so every skill folder stands alone. `scripts/sync-shared.sh` does the copy; `package.sh` runs it first.

## Example prompts

- "im pitching my invoice-chasing app to angels next week. its just me, ex-bookkeeper, 40 on the waitlist, no revenue. help me with why-you and the questions."
- "12k downloads, 310 paying at 6.99 a month, asking 150k for 8% on Shark Tank. help me with the valuation question."
- "Dissect this pitch: [paste a transcript or your notes]"

## Tests

Each skill has two cases under `skills/<name>/evals/`, in the folder format that `claude plugin eval` reads: a `prompt.md`, a `case.yaml` and one-sentence graders. `docs/EVALS.md` holds the results of two rounds (with the skill against the same prompt without it). In short: the skills mostly stopped invented figures and added named cases, and the product skill barely beat plain Claude. The sample is small and the runs were single-shot, so read them as a sanity check, not a benchmark.

## Limits

- The cases were assembled in November 2026 and will age. Post-show outcomes change.
- Dragons' Den, Canada, Australia and India are thinner than US Shark Tank and Y Combinator, and the Canadian and Indian samples are small.
- The ranked question lists are a judgement from a small sample, not counts over every episode.
- The description fields have not been tuned with a trigger-optimisation loop. If a skill under- or over-triggers in your setup, edit its `description`.

## Sources

See [docs/SOURCES.md](docs/SOURCES.md). This project is not affiliated with Shark Tank, Dragons' Den or Y Combinator; names belong to their owners.

## Contributing

Corrections to a case are welcome. Open an issue or pull request with a source link, and say whether it is a transcript, a recap or a company claim. Do not paste copyrighted transcripts.

## License

MIT. See [LICENSE](LICENSE).
