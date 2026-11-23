# Eval results

Each skill has two cases under `skills/<name>/evals/`. Only the first case of each skill was run, in two rounds. Read this as a sanity check, not a benchmark.

## How it was run

- One prompt per skill, run once with the skill and once without it (same model, one shot, the model told not to ask questions back).
- Each response was graded against one-sentence assertions (the files in `graders/`) by a separate model call, which quoted evidence for each pass or fail.
- Round 1 used the first draft of each skill. Round 2 re-ran the skills after fixing what round 1 found, and added graders where round 1 did not separate the two configurations.

## Round 1 (first drafts)

| Skill | Case | With skill | Without skill | What separated them |
|---|---|---|---|---|
| pitch-founder-centric | solo-founder-no-revenue | 5/5 | 2/5 | Baseline left facts unbracketed, put the ask before the weakness, cited no case |
| pitch-service-centric | mobile-dog-groomers-marketplace | 5/5 | 3/5 | Baseline invented a price, GMV, revenue, rebook rate and valuation |
| pitch-product-centric | journaling-app-valuation | 5/5 | 5/5 | Nothing: the graders were too easy for this case |
| pitch-concept-centric | household-chore-market | 5/5 | 2/5 | Baseline invented use-of-funds splits and a valuation range, with no why-now or mechanism placeholders |
| pitch-coach | classify-ai-tutoring | 3/4 | 2/4 | With-skill never named the focus skill to use next |

## Round 2 (after fixes)

| Skill | With skill | Without skill | Notes |
|---|---|---|---|
| pitch-founder-centric | 5/6 | 3/6 | Both failed the new "no unbracketed inference" grader. The with-skill response still asserted "I'm a bookkeeper, not a salesperson" |
| pitch-product-centric | 8/8 | 7/8 | Two new graders added (a view on the valuation, a named case). Baseline failed only the named-case grader. With-skill answer was longer (1,545 words against 1,082) |
| pitch-concept-centric | 6/6 | 3/6 | Baseline had no why-now or mechanism placeholders, did not mark its alternative as judgement, and put unlabelled numbers in its hints |
| pitch-coach | 4/4 | not re-run (2/4 in round 1) | First reply was 343 words |
| pitch-service-centric | not re-run | not re-run | Round 1 result stands |

## Changes made after round 2 and not re-tested

- Founder: use the user's own wording for role and tense, and state only weaknesses the user named.
- All four focus skills: keep the first reply under about 800 words, and tag each case figure "(reported)".

## What this does not show

- **One run per case, one model.** There were no repeats, so run-to-run variation is unmeasured.
- **Not independent.** The same author wrote the skills, the prompts and the graders, and the graders were model calls. Prompts were chosen to expose the failure modes the skills target.
- **Eight of the ten cases were never run.** They are in the repo for you to run.
- **The product skill barely separated from the baseline.** Plain Claude already did the arithmetic correctly and bracketed the unknowns. The skill's added value there is the named cases, the structure and the valuation view, not basic honesty.
- **The skills lengthen answers.** Round 2 added a length rule to bring that down, but it has not been measured.
- **Trigger accuracy is untested.** The `description` fields were not tuned with a trigger-optimisation loop.

## Reproduce

`claude plugin eval` reads the `evals/` folders directly. Without it, give each `prompt.md` to a model with and without the skill, then check the output against each file in `graders/`.
