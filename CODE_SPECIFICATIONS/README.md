# Quizly — Planning Documents

This folder contains the complete planning specification for the Quizly mobile app. A coding agent should be able to implement the entire MVP using only these documents.

## Read Order

Read the documents in order. Each builds on the previous.

| # | File | What it covers |
|---|---|---|
| 01 | `01-overview.md` | Product vision, MVP scope, what's in / out, success criteria, tech stack at a glance |
| 02 | `02-architecture.md` | Layered architecture, folder structure, state management, navigation, data flow |
| 03 | `03-database.md` | All Firestore collections, document schemas, indexes, security rules, local Hive boxes |
| 04 | `04-design.md` | Complete design system — colors, typography, spacing, components, motion |
| 05 | `05-screens.md` | Every screen with layout, components, states, interactions, edge cases |
| 06 | `06-features.md` | Deep-dive logic for every feature — auth, quiz creation, attempt, leaderboard, etc. |
| 07 | `07-firebase.md` | Firebase project setup, dependencies, platform configuration, initialization |
| 08 | `08-deeplinks.md` | Branch.io setup, link structures, deferred deep linking, web fallback |
| 09 | `09-notifications.md` | FCM, local notifications, payloads, foreground/background handling |
| 10 | `10-tasks.md` | Master atomic task breakdown for implementation |
| 11 | `11-coding-style.md` | Conventions, lint rules, naming, error handling, git workflow |

## How a Coding Agent Should Work With This

1. **Read everything first.** Don't start coding after reading just one doc. The pieces interlock.
2. **Implement T0.1 onward.** Tasks in `10-tasks.md` are ordered intentionally.
3. **For each task:**
   - Open the referenced doc section
   - Implement exactly as specified
   - Don't invent details that aren't in the docs
   - If something is missing, default to the simpler choice and flag with `// REVIEW:`
4. **Commit per task.** Use task ID in the commit message.
5. **Run codegen after model changes.** `dart run build_runner build --delete-conflicting-outputs`

## Visual References

Open `design-preview-v5.html` in a browser to see the target UI for Home, Question, Results, and Create screens. This is the source of truth alongside `04-design.md` for visual decisions.

## Decision Authority

If two docs contradict each other:
- For visual: `04-design.md` wins
- For data: `03-database.md` wins
- For logic: `06-features.md` wins
- For structure: `02-architecture.md` wins

## What's NOT in the Docs

- Cloud Functions (deferred to post-MVP)
- AI question generation (deferred)
- Live multiplayer (deferred)
- Public quiz discovery (deferred)
- Monetization (deferred)

These will get their own planning docs when they're built.

## Estimating Effort

Roughly 60-80 atomic tasks. A focused human developer would take 2-3 weeks. A coding agent operating sequentially with human review per task would take similar wall-clock time with much less hands-on dev work.

---

*Last updated: May 2026*
