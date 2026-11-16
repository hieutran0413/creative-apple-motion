---
name: native-motion-choreography
description: Implement or debug SwiftUI and UIKit animation, interactive transitions, gestures, springs and app motion on iOS, iPadOS and macOS. Use for interruptible native choreography, shared-element transitions and lifecycle-safe motion.
---
# Native Motion Choreography

Read ../../references/platform-contract.md. Inspect the owning view, model, navigation container and deployment targets before editing.

## Choose the owner
- SwiftUI: drive visuals from explicit state, scope animation to the intended value or transaction, and use stable view identity. Use phase/keyframe APIs only when available and useful. Avoid a broad implicit animation modifier that also animates unrelated layout updates.
- Matched geometry: use a coherent namespace and source/destination identity, handle rapid state changes, and verify behavior in the actual navigation/presentation hierarchy. Do not assume it automatically bridges arbitrary windows or presentations.
- UIKit: use UIViewPropertyAnimator for scrubbable/reversible view motion; define animator lifetime, start/end state and completion behavior. For custom navigation transitions use the transition context and finish/cancel correctly.
- Core Animation: keep model-layer and presentation-layer values coherent when interrupting explicit animations. Do not use persistent fill mode as a substitute for updating final model state.
- Native macOS: use SwiftUI or appropriate AppKit animation APIs. Never import UIKit into the macOS branch. Keep Catalyst separate from native macOS.

## Choreograph state transitions
Define idle, active, settling, completed and cancelled states as needed. Choose whether repeated input reverses, retargets or replaces the running sequence; do not accumulate delayed tasks. Prefer framework completion/state mechanisms over guessed timer delays. Tie asynchronous work to an owner and cancel stale work after disappearance or replacement.
Separate gesture translation from committed layout state. Start a new gesture from the visible/current state without snapping; bound progress and velocity. Handle cancellation, edge gestures, scroll competition, keyboard actions and focus. Keep normal navigation and dismissal available.
Use one coordinate space for measurement and explicitly convert across views. Recompute geometry on rotation, window resize, safe-area changes and Dynamic Type changes. Preserve semantic selection and state through adaptive layout changes.

## Accessibility and lifecycle
Read Reduce Motion through SwiftUI environment or platform accessibility settings; respond to changes while open. Replace large travel, camera rotation and continuous decoration with stable states or restrained fades. Preserve feedback and all actions.
Keep VoiceOver order, focus return, keyboard shortcuts and selection consistent with the visual transition. Do not make opacity-zero controls remain accidentally interactive. Haptics are optional, capability-aware feedback with a visual equivalent.
Pause owned clocks/display links when inactive or offscreen; invalidate on teardown. Avoid retain cycles in animator/completion/display-link closures. A multiwindow app must not use a single global animator for all windows.

## Verify
Use ../apple-motion-review/SKILL.md. Exercise rapid tap/reverse/cancel, navigation away/back, resize mid-transition, Reduce Motion and keyboard/VoiceOver paths. Do not claim exact spring parity with a reference without observation.
