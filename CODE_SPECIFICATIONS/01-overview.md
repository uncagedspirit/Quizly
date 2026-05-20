# 01 — Overview

## What is Quizly

A mobile-first quiz app where any logged-in user can create a quiz, share a unique 6-character code, and have anyone (logged in or not) attempt it. Designed to feel premium, fun, and lightweight from day one.

---

## Core Value Proposition

- **For creators** — Make a quiz in under 60 seconds, share a code, see who attempted and how they did.
- **For attempters** — No friction. Open app, enter code, start playing. No mandatory account.
- **For everyone** — Beautiful design, satisfying interactions, and a leaderboard that makes you want to come back.

---

## MVP Feature Set

### 1. Authentication
- Google Sign-In (one-tap)
- Email + Password
- **Guest mode** — attempt quizzes without account, with local persistence
- Guest-to-account migration on signup (silent, automatic)

### 2. Quiz Creation
- Title, optional description
- Add multiple-choice questions (4 options each) and True/False questions
- Mark correct answer per question
- Reorder questions (drag handle)
- Settings:
  - **Anonymous toggle** — let attempters skip name entry
  - **Per-question timer** — fixed seconds for each question (e.g., 30s), or off
  - **Quiz deadline** — fixed real-world datetime when the quiz closes
  - **Answer reveal mode** — three options:
    - `after_each` — taker sees right/wrong after submitting each answer
    - `at_end` — full breakdown shown only when quiz finishes (or deadline hits, if set)
    - `none` — only score shown, never the correct answers
- Publish → generate unique 6-char alphanumeric code (`QZ` prefix optional, decided in DB doc)

### 3. Quiz Attempt
- Enter code from home screen → load quiz
- If creator requires name → name entry screen
- If anonymous allowed → skip directly to questions
- Question-by-question flow with progress bar
- Per-question timer if set (auto-advances when 0)
- Submit answers as user goes (don't wait until end)
- Show reveal feedback only if creator chose `after_each`

### 4. Results & Leaderboard
- Score card: X/Y correct, time taken, rank
- Stat pills: correct, wrong, rank, time
- Mini-leaderboard (top 3 + you)
- Full leaderboard (separate screen)
- Question-by-question breakdown if reveal mode allows
- **Share Result** — generates a shareable image + deep link
- **Challenge a Friend** — generates personal challenge deep link with your score embedded

### 5. Creator Dashboard
- Per-quiz: number of attempts, average score, hardest question, full leaderboard
- Edit (only before any attempts), delete, archive (soft-delete)
- Copy code, copy share link

### 6. Notifications (FCM)
- Quiz deadline reached → notify all attempters that results are revealed
- Someone attempted your quiz → notify creator (debounced to once per day max)
- Challenge received → notify recipient
- Works for both logged-in and guest users (device-token based)

### 7. Deep Linking (Branch.io)
- Quiz code link → open app to quiz attempt screen
- Challenge link → open app with challenger context
- Deferred deep linking → install from Play/App Store → app opens to original destination
- Web fallback page if link broken or user dismisses install

### 8. Search / Code Entry
- Home screen has a prominent code entry card
- Auto-formats `qz4x9k` → `QZ4X9K` as user types
- 6-char input, validates against DB

### 9. Reporting & Moderation
- Report a quiz (basic — sends to a `reports` Firestore collection)
- Block a creator (local-only for MVP)

---

## Explicitly Excluded From MVP

| Feature | Why excluded |
|---|---|
| Live multiplayer (Kahoot-style) | Realtime sync is complex; ship later as premium |
| AI question generation | Adds API cost and latency; later feature |
| Public quiz discovery feed | Needs moderation infra; phase 2 |
| Payments / monetization | No revenue logic until traction |
| Creator profiles & following | Social layer comes after platform proves itself |
| Image-based questions | Adds upload/storage complexity |
| Multi-language | English-only at launch |
| Web app | Mobile-first focus |

---

## Success Criteria for MVP

- A creator can publish a quiz in under 90 seconds.
- An attempter can complete a quiz from cold app open to score screen in under 2 minutes.
- 100% of core flows work offline-tolerant (queue submissions if no network).
- App size under 25 MB on Android (Flutter baseline).
- Cold start under 2.5 seconds on mid-range Android device.

---

## Tech Stack Summary

| Layer | Choice |
|---|---|
| Mobile framework | Flutter (latest stable) |
| State management | Riverpod (riverpod_generator) |
| Navigation | Go Router |
| Backend | Firebase (Auth, Firestore, FCM, Storage) |
| Deep links | Branch.io |
| Local storage | Hive (typed boxes) |
| Image generation (share cards) | `screenshot` package + `share_plus` |
| Analytics | Firebase Analytics (basic events only) |

---

## Audience & Use Cases

- Teachers running quick quizzes for a class
- Friends in a group chat sending each other quizzes
- Content creators (later — public quizzes)
- Self-study and trivia hobbyists

The product is positioned as **casual but premium-feeling**. It must not look like a school tool. It must not look like a toy. The aesthetic is "spring-fresh, confident, alive."
