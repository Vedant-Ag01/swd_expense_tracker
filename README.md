# Expense Tracker - SWD Nucleus Induction

**Developer:** Vedant Agarwal
**ID:** 2025A7PS0025H

## Objective
A fully functional Expense Tracker built using Flutter and Riverpod, satisfying all requirements for the SWD Nucleus Induction task.

## Features
- **Add & View:** Log new expenses with title, amount, date, and category.
- **Edit & Delete:** Modify existing entries or swipe to delete.
- **Dynamic Math:** Real-time calculation of total expenses.
- **Category Filter:** Filter the list view by specific categories using a custom dropdown.
- **Persistent Storage:** Data is seamlessly saved locally across app restarts.

## Technical Stack
- **Framework:** Flutter
- **State Management:** Riverpod 
- **Local Storage:** `shared_preferences`

## Folder Structure
 Following the required architectural guidelines:
- `models/` - Core data structures and JSON serialization.
- `providers/` - Riverpod state management and business logic.
- `services/` - Local storage logic (`local_storage_service.dart`).
- `screens/` - Main UI views.
- `widgets/` - Reusable UI components (`expense_list.dart`, `new_expenses.dart`).

## AI Usage Disclosure
 As per the induction guidelines, AI (Google Gemini) was used in an assistive capacity during development:
- **State Management & Storage:** Used to understand Riverpod's `.fold()` for derived state and to structure the `shared_preferences` JSON serialization.
- **UI/UX:** Assisted in generating the custom Material purple theme and resolving type mismatch errors in the Flutter `PopupMenuButton`.
- **Debugging:** Used as a sounding board to troubleshoot strict typing errors in Dart (e.g., understanding the difference between `.where` and `.firstWhere`).
- **Documentation:** Assisted in structuring and drafting this `README.md` file.
- *Note: All core logic implementation, widget composition, and the custom "Delete and Replace" editing architecture were conceptualized and written manually.*

