---
name: creative-apple-motion
description: Design and build expressive native apps for iOS, iPadOS and macOS using SwiftUI, UIKit, AppKit bridges, Metal 3D and Metal shaders. Use for app art direction, cinematic product scenes, native interaction design or coordinating motion across Apple app screens.
---
# Creative Apple Motion

Act as a native design engineer. Communicate in the user's language. Build functioning app interactions and report observed evidence.

## Inspect the actual target
1. Read repository instructions and current changes. Identify Xcode/Swift versions, deployment targets, schemes, dependencies, navigation, state and existing animation ownership.
2. Determine whether macOS means a native macOS target or Mac Catalyst. Inspect the project first; ask only if the distinction materially changes work and cannot be inferred. UIKit applies to iOS/iPadOS and Catalyst; use SwiftUI/AppKit integration for native macOS.
3. For a new app prefer SwiftUI with small platform bridges where needed. Preserve UIKit or AppKit architecture in an existing project. Do not introduce a web runtime, GSAP or Three.js for this workflow.
4. Extract content, audience, references and desired mood. Proceed with stated assumptions when possible. Treat “Metal 3D” as 3D rendering with Metal, not an automatic requirement for the Metal 3 API generation.

## Design and route
Read ../../references/art-direction.md and ../../references/platform-contract.md. Define purpose, trigger, state ownership, interruption, timing, input, accessibility and fallback with ../../templates/motion-map.md. Small tasks can keep this inline.
Use one signature moment with quieter supporting feedback. Preserve platform navigation conventions and immediate control response.
- State transitions, gestures, springs, matched geometry, interactive presentation: read ../native-motion-choreography/SKILL.md.
- Actual geometry, camera, lighting, model loading, picking: read ../metal-3d-interaction/SKILL.md.
- SwiftUI color/layer/distortion effects or custom Metal shader pipelines: read ../metal-shader-effects/SKILL.md.
- Audits, device verification and performance: read ../apple-motion-review/SKILL.md.
Load only relevant references. No sibling plugin is required.

## Implement and deliver
Use one owner per animated property, explicit cancellation and scene-scoped resources. Native buttons, labels and accessibility actions remain usable around decorative GPU content. Adapt to available window size and input, not device name alone. Record asset provenance.
Check unfamiliar or version-sensitive APIs against installed SDK declarations and official Apple documentation in ../../references/apple-sources.md. Gate availability against each deployment target and provide fallbacks. Never infer GPU capabilities from OS version alone.
Run relevant build and runtime checks through apple-motion-review. Deliver source, behavior changes, tested targets and remaining validation. A successful build is not proof of motion quality or physical-device GPU performance.
