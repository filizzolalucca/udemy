# SwiftUI Course Projects

Projects I built while taking a SwiftUI course on Udemy. The code comments include my own study notes (in Portuguese) about the concepts covered in each lesson.

<p>
  <img src="https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white" alt="Swift 6">
  <img src="https://img.shields.io/badge/SwiftUI-blue?logo=swift&logoColor=white" alt="SwiftUI">
  <img src="https://img.shields.io/badge/iOS-26.5+-lightgrey?logo=apple" alt="iOS 26.5+">
</p>

## Projects

### 🪙 Currency Converter (`swift_ui/swiftui/ConvertorMonetario`)

A fantasy-themed currency exchange for the *Prancing Pony* inn: convert between copper pennies, silver pennies, silver pieces, gold pennies and gold pieces.

<p align="center">
  <img src="docs/screenshots/converter-main.jpg" alt="Converter" width="230">
  &nbsp;
  <img src="docs/screenshots/converter-picker.jpg" alt="Currency picker" width="230">
  &nbsp;
  <img src="docs/screenshots/converter-rates.jpg" alt="Exchange rates" width="230">
</p>

- Two-way conversion: typing in either field updates the other in real time
- Currency picker sheet with a grid of coins for the "from" and "to" currencies
- Exchange rates screen explaining how each coin converts to the next
- Selected currencies saved with `UserDefaults`
- An onboarding hint built with **TipKit**

**Concepts practiced:** `@State`, `@Binding`, `@FocusState`, `@Environment(\.dismiss)`, sheets, `LazyVGrid`, enums with `CaseIterable` and raw values, asset symbols (`ImageResource`) and modifier order.

## Running a project

1. Clone the repository:
   ```bash
   git clone https://github.com/filizzolalucca/udemy.git
   ```
2. Open the project's `.xcodeproj` (for example `swift_ui/swiftui/ConvertorMonetario/ConvertorMonetario.xcodeproj`) in Xcode 26 or later.
3. Pick a simulator and press **⌘R**.

## Author

**Lucca Filizzola** · [@filizzolalucca](https://github.com/filizzolalucca)
